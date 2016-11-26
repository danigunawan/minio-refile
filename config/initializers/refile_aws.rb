require "refile/s3"

aws = {
  access_key_id: "Q3AM3UQ867SPQQA43P2F",
  secret_access_key: "zuf+tfteSlswRu7BJ86wekitnifILbZam1KYY3TG",
  region: "us-east-1",
  bucket: "refile",            # Provide your host name here, otherwise fog-aws defaults to
                                                       # s3.amazonaws.com
  endpoint:              'https://play.minio.io:9000', # Required, otherwise defauls to nil
  force_path_style:           true                    # Required
}

Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)
