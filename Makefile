git_sha1 = $(shell git rev-parse --short HEAD)

build-images:
	docker build -t big_data_airflow:$(git_sha1) ./airflow

deploy: build-images
	# https://stackoverflow.com/a/60817927/3902555
	helm upgrade  \
		--install \
		--wait \
		--set cwd=$(shell pwd) \
		--set imageTag=$(git_sha1) \
		--namespace=big-data-pipeline \
		--create-namespace \
		--debug \
		big-data-pipeline \
		./charts
