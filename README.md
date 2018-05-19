[![Stories in Ready](https://badge.waffle.io/jaywink/ansible-socialhome.png?label=ready&title=Ready)](https://waffle.io/jaywink/ansible-socialhome)

Ansible role - Socialhome
=========================

Deploy [Socialhome](https://github.com/jaywink/socialhome) using Ansible.

Role will also install Apache2 with a LetsEncrypt SSL certificate and by default a PostgreSQL database (this can be disabled).

Requirements
------------

Ansible 2.0+

Role Variables
--------------

See `defaults/main.yml` for the full list.

The following are required to use the role and have no (sane) defaults.

    # Name of admin
    socialhome_admin_name:

    # Email of admin
    socialhome_admin_mail:

    # Database password
    socialhome_db_password: socialhome

    # Set to true if you want to create an account through the registration process
    socialhome_disable_registrations: true

    # Domain where instance lives
    socialhome_domain: socialhome.local

    # Django secret key
    socialhome_secret_key:

    # Email
    # Set backend to "smtp" for smtp emails - currently only one supported
    # If not set to "smtp", emails will just print in console
    # Mails use TLS by default
    socialhome_email_backend:
    socialhome_email_host: localhost
    socialhome_email_port: 587
    socialhome_email_host_user:
    socialhome_email_host_password:
    socialhome_email_from: "noreply@socialhome.local"

Disabling Postgres database installation
----------------------------------------

To instead use an existing postgresql database, define the variable `socialhome_db_install_postgres: false` and postgres install will be skipped.

Dependencies
------------

Depends on the following roles:

* geerlingguy.nodejs
* jaywink.letsencrypt  # If `socialhome_https` is not disabled.

If you don't disable HTTPS (which you shouldn't!), you MUST set valid `ansible-letsencrypt` variables, for example:

    letsencrypt_email: yourmail@example.com
    letsencrypt_domain: example.com
    letsencrypt_request_www: false
    letsencrypt_force_renew: false

See full list [here](https://github.com/jaywink/ansible-letsencrypt/blob/master/defaults/main.yml).

Example Playbook
----------------

    ---
    - hosts: myhost
      become: yes
      become_user: root

      vars:
        # place vars here on in a separate file

      roles:
        - jaywink.letsencrypt
        - jaywink.socialhome

License
-------

MIT

Author Information
------------------

Jason Robinson / https://jasonrobinson.me
