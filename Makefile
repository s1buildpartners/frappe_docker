FRAPPE_VERSION := v16.8.0
HELPDESK_VERSION := v1.20.0
TELEPHONY_VERSION := develop
DRIVE_VERSION := develop
LMS_VERSION := develop

container:
	docker build \
		--platform linux/arm64 \
		--build-arg FRAPPE_BRANCH=${FRAPPE_VERSION} \
		--build-arg HELPDESK_BRANCH=${HELPDESK_VERSION} \
		--build-arg TELEPHONY_BRANCH=${TELEPHONY_VERSION} \
		--build-arg DRIVE_BRANCH=${DRIVE_VERSION} \
		--build-arg LMS_BRANCH=${LMS_VERSION} \
		--tag ghcr.io/s1buildpartners/frappe:latest \
		--file images/custom/Containerfile \
		.
	docker push ghcr.io/s1buildpartners/frappe:latest

# temporary target to build the Drive app using the main branch so we can work around https://github.com/frappe/drive/issues/596
container-main:
	docker build \
		--platform linux/arm64 \
		--build-arg FRAPPE_BRANCH=${FRAPPE_VERSION} \
		--build-arg HELPDESK_BRANCH=${HELPDESK_VERSION} \
		--build-arg TELEPHONY_BRANCH=${TELEPHONY_VERSION} \
		--build-arg DRIVE_BRANCH=main \
		--build-arg LMS_BRANCH=${LMS_VERSION} \
		--tag ghcr.io/s1buildpartners/frappe:gh596fix \
		--file images/custom/Containerfile \
		.
	docker push ghcr.io/s1buildpartners/frappe:gh596fix
