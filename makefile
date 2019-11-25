all:
	docker build . -t cstore-relay

nocache:
	docker build --no-cache . -t cstore-relay
