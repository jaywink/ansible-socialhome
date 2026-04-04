# Socialhome

Install [Socialhome](https://socialhome.network).

Requires a load balancer and a PostgreSQL database.

## Requirements

Traffic will need to be routed to either the Django app container or the Nginx container,
depending on the traffic. Please see the following routing rules that will need to be
set up from the `defaults/main.yml` file, from the variables `socialhome_docker_labels_app`
and `socialhome_docker_labels_nginx`. If you use Traefik 2.x, this routing will be set up
by default, otherwise you will need to adjust the labels or route to the containers
in whatever way works best for your setup.

## Role Variables

Please see `defaults/main.yml` for required and optional variables.

## Dependencies

In addition to routing, you will need to set up a PostgreSQL database. Please see
`defaults.yml` for how to configure the database.

## Example Playbook

    - hosts: server
      roles:
        - role: jaywink.socialhome
          vars:
            socialhome_domain: socialhome.local
            socialhome_db_host: 127.0.0.1
            socialhome_db_name: socialhome
            socialhome_db_password: socialhome
            socialhome_db_user: socialhome
            socialhome_secret_key: foobar

## License

BSD

## Author Information

Jason Robinson / https://jasonrobinson.me / @jaywink:federator.dev
