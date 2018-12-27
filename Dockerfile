FROM iron/go
WORKDIR /app
ADD nonstandard-port-test-docker /app/
COPY static/ /app/static/
EXPOSE 5678
ENTRYPOINT ["./nonstandard-port-test-docker"]

