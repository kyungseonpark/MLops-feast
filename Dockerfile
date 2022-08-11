# Base Image
FROM openjdk:8u332-slim-bullseye
COPY --from=python:3.8.13-slim-bullseye / /
# mkdir error solution
RUN groupadd feast
RUN mkdir -p /.cache
RUN chmod 770 /.cache
RUN chown root:feast /.cache
# copy requirements
COPY requirements-feast.txt /tmp/requirements.txt
# install package
RUN pip install -r /tmp/requirements.txt
