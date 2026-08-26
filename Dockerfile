# syntax=docker/dockerfile:1
# Zope 5 / Python 3 Reportek BDR image overlay.
# Official Zope5/Python3 base image for migrated Reportek BDR.

ARG TARGETPLATFORM=linux/amd64

FROM --platform=$TARGETPLATFORM dhi.io/uv:0 AS uv

FROM --platform=$TARGETPLATFORM eeacms/reportek-base-dr:z5-1.34

USER root

COPY --from=uv /uv /usr/local/bin/uv
COPY requirements.txt /opt/zope/requirements-bdr.txt
COPY src/site.zcml /opt/zope/etc/site.zcml

ENV DATADICTIONARY_SCHEMAS_URL=http://dd.eionet.europa.eu/api/schemas/forObligation \
    REPORTEK_DEPLOYMENT=BDR \
    zope_i18n_compile_mo_files=true

RUN uv pip install --python=/opt/zope/bin/python \
    --index-url https://pypi.org/simple \
    --find-links https://eggrepo.eea.europa.eu/simple/ \
    -r /opt/zope/requirements-bdr.txt && \
    chown ${ZOPE_UID}:${ZOPE_GID} /opt/zope/etc/site.zcml

USER zope-www
