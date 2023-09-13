# Bedrock + Docker + apache boilerplate

## Bedrock

Read more about [Bedrock](https://roots.io/bedrock)

## Running the project

This section describe how to run the project with and without docker

### Running using docker

#### Create `env` files

- Create `.env` file with the content of `.env.example`.
- Create `.env.database` file with the content of `.env.database.example`
- Create `init.sql` file with the content of init.sql.example

if you need to update the apache VirtualHost configuration that boot the web container, update the `vhost.conf` file

- create `dbdata` in the root folder

#### Running containers

We provide docker compose for this than just run the command below

```bash
docker compose up
```

after install there should be a wp folder in web/
otherwise go into the web container with

- docker exec -it web_container_id bash
- composer install

Once containers start go to `http://localhost:8000`

## Deployment

read about server configuration https://roots.io/bedrock/docs/server-configuration/

### debug

to remove image
docker rmi -f docker_image

to see config value take by docker-compose from env
docker-compose config

### Running without docker

#### Requirement

Ensure that you have `php` and `composer` installed on you computer.

#### Install dependencies

In the root folder run the command below

```bash
composer install
```

#### Adding a plugin with composer

To add a plugin, add it under the require directive or use composer require <namespace>/<packagename> from the command line.
If the plugin is from WordPress.org, then the namespace is always wpackagist-plugin:

```bash
composer require wpackagist-plugin/akismet
```

plugins and mu-plugins are ignored in Git by default since Composer manages them. If you want to add something to those folders that isn't managed by Composer, you need to update .gitignore to allow them to be added to your repository:

!web/app/plugins/plugin-name

#### Adding WordPress themes with Composer

```bash
composer require wpackagist-theme/twentytwentythree
```

#### Disable plugin by environment

https://roots.io/bedrock/docs/disable-plugins-based-on-environment/

#### Start the server

The `localhost:8000` is the host of the server, ensure it is the same with the `WP_HOME` env variable

### VS code dev tip

ctrl + space in markdown file to see suggestion
