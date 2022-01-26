FROM jboss/keycloak:14.0.0 

ARG KEYCLOAK_THEME="gims"
ENV KEYCLOAK_THEME=$KEYCLOAK_THEME
LABEL maintainer="D3b Center(ops@d3b.center)"
USER root
RUN microdnf install -y findutils
USER jboss
COPY ./${KEYCLOAK_THEME} /opt/jboss/keycloak/themes/${KEYCLOAK_THEME}
