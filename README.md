# RoR Pet catalog app using refile and minio [![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/minio/minio?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

This project is made with the help of this [tutorial](http://cecycorrea.com/2015/07/22/rails-refile-tutorial.html)

![minio_ROR](https://github.com/sadysnaat/minio-refile/blob/master/docs/Screenshot.png?raw=true)

Example Ruby on Rails App that works with a Minio Server. We will use the **refile** in our rails app to upload objects to a Minio Server. Full code is available here : https://github.com/sadysnaat/minio-refile, released under Apache 2.0 License.

## 1. Prerequisites

* Install mc  from [here](https://docs.minio.io/docs/minio-client-quickstart-guide).
* Install Minio Server from [here](https://docs.minio.io/docs/minio ).
* [ruby 2.0](https://www.ruby-lang.org/en/documentation/installation/#package-management-systems) and above
* [rails 4.0](http://guides.rubyonrails.org/v4.0/)  and above


## 2. Dependencies

* [refile](https://github.com/carrierwaveuploader/carrierwave)
* [refile-s3](https://github.com/refile/refile-s3)
* [twitter-bootstrap-rails](https://github.com/seyhunak/twitter-bootstrap-rails)
* [refile-mini_magick](https://github.com/refile/refile-mini_magick)

## 3. Install

```bash
$ git clone git@github.com:sadysnaat/minio-refile.git
$ cd minio-refile
$ bundle install
```
## 4. Set Up Bucket

In this example I have used [minio public server](https://play.minio.io:9000) and bucket is **refile**. 

If you wish to use another bucket, create a new bucket with the following command. 
```sh
$ mc mb play/new_bucket_name
```

## 5. Configure carrierwave defaults to Minio Server

```ruby
# Create an initializer 
require 'refine/s3'

aws = {
	access_key_id: "Q3AM3UQ867SPQQA43P2F",
	secret_access_key: "zuf+tfteSlswRu7BJ86wekitnifILbZam1KYY3TG",
	region: "us-east-1",
	bucket: "refile",                                    # Provide your host name here, otherwise fog-aws defaults to
	                                                     # s3.amazonaws.com
	endpoint: "https://play.minio.io:9000",              # Required, otherwise defauls to nil
	force_path_style: true                               # Required
}

Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)
```


## 8. Run The App

```sh

$ rake db:migrate
$ rails s

```
Now if you visit http://localhost:3000 you should be able to see the example application.
