default: test

include ../../../helpers/examples.mk

RELEASE := elasticsearch
NAMESPACE := elastic

install:
	helm upgrade --namespace $(NAMESPACE) --wait --timeout=60000 --install --values ./security.yml $(RELEASE) ../../

purge:
	kubectl delete secrets elastic-credentials elastic-certificates elastic-certificate-pem --namespace $(NAMESPACE) || true
	helm del --purge $(RELEASE)

test: secrets install goss

secrets:
	docker rm -f elastic-helm-charts-certs || true
	rm -f elastic-certificates.p12 elastic-certificate.pem elastic-stack-ca.p12 || true
	password=$$([ ! -z "$$ELASTIC_PASSWORD" ] && echo $$ELASTIC_PASSWORD || echo $$(docker run --rm docker.elastic.co/elasticsearch/elasticsearch:$(STACK_VERSION) /bin/sh -c "< /dev/urandom tr -cd '[:alnum:]' | head -c20")) && \
	docker run --name elastic-helm-charts-certs -i -w /app \
		docker.elastic.co/elasticsearch/elasticsearch:$(STACK_VERSION) \
		/bin/sh -c " \
			elasticsearch-certutil ca --out /app/elastic-stack-ca.p12 --pass '' && \
			elasticsearch-certutil cert --name security-master --dns security-master --ca /app/elastic-stack-ca.p12 --pass '' --ca-pass '' --out /app/elastic-certificates.p12" && \
	docker cp elastic-helm-charts-certs:/app/elastic-certificates.p12 ./ && \
	docker rm -f elastic-helm-charts-certs && \
	openssl pkcs12 -nodes -passin pass:'' -in elastic-certificates.p12 -out elastic-certificate.pem && \
	kubectl create secret generic elastic-certificates --namespace $(NAMESPACE) --from-file=elastic-certificates.p12 && \
	kubectl create secret generic elastic-certificate-pem --namespace $(NAMESPACE) --from-file=elastic-certificate.pem && \
	kubectl create secret generic elastic-credentials  --namespace $(NAMESPACE) --from-literal=password=$$password --from-literal=username=elastic && \
	rm -f elastic-certificates.p12 elastic-certificate.pem elastic-stack-ca.p12
