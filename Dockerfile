FROM quay.io/keycloak/keycloak:22.0.0

WORKDIR /opt/keycloak

COPY /target/keycloak-sha1.jar /opt/keycloak/providers/

RUN /opt/keycloak/bin/kc.sh build --features="preview"

ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

EXPOSE 8080
EXPOSE 8443

ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start --optimized", "--proxy=edge"]