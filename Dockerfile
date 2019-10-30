FROM eeacms/reportek-base-dr:2.3.1
MAINTAINER "EEA: IDM2 C-TEAM" <eea-edw-c-team-alerts@googlegroups.com>

ENV DATADICTIONARY_SCHEMAS_URL=http://dd.eionet.europa.eu/api/schemas/forObligation \
    REPORTEK_DEPLOYMENT=BDR \
    zope_i18n_compile_mo_files=true \
    SESSION_MANAGER_TIMEOUT=120

COPY src/sources.cfg           \
     src/bdr-instance.cfg      \
     src/base.cfg               $ZOPE_HOME/
COPY src/docker-initialize.py       /

USER root
RUN ./install.sh
USER zope-www
