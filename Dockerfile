FROM eeacms/reportek-base-dr:1.6.1
MAINTAINER "Olimpiu Rob" <olimpiu.rob@eaudeweb.ro>

ENV DATADICTIONARY_SCHEMAS_URL=http://dd.eionet.europa.eu/api/schemas/forObligation \
    REPORTEK_DEPLOYMENT=BDR \
    zope_i18n_compile_mo_files=true \
    SESSION_MANAGER_TIMEOUT=120 \
    EVENT_LOG_LEVEL=ALL \
    Z2_LOG_LEVEL=ALL

COPY src/sources.cfg            $ZOPE_HOME/
COPY src/bdr-instance.cfg       $ZOPE_HOME/
COPY src/base.cfg               $ZOPE_HOME/

USER root
RUN ./install.sh
USER zope-www
