container:
	docker build \
		--platform linux/arm64 \
		--build-arg FRAPPE_BRANCH=v16.8.0 \
		--tag ghcr.io/s1buildpartners/frappe:latest \
		--file images/custom/Containerfile \
		.
