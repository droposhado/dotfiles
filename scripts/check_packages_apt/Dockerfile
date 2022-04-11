ARG IMAGE

FROM $IMAGE

COPY ./.Aptfile /Aptfile
COPY ./scripts/check_packages_apt.py /packages.py

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3-apt && python3 /packages.py /Aptfile
