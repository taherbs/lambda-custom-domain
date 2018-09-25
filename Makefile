# automated deployment makefile

.PHONY: init
init:
	npm init -y

.PHONY: create-aws-resources
create-aws-resources:
	sceptre --dir ./aws-resources launch-env infrastructure && \
	sceptre --dir ./aws-resources describe-stack-outputs infrastructure domain

.PHONY: deploy-serverless
deploy-serverless:
	serverless create_domain && \
	serverless deploy -v

.PHONY: remove-serverless
remove-serverless:
	serverless remove && \
	serverless delete_domain
