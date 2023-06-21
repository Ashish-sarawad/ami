module "gitlab_ref_arch_aws" {
  source = "../../modules/gitlab_ref_arch_aws"

  prefix         = var.prefix
  ssh_public_key = file(var.ssh_public_key_file)
    
  ### Network####
  create_network = true
  vpc_cidr_block = "10.0.0.0/16"
  subnet_pub_count = 3
  subnet_priv_count = 3
  subnet_pub_cidr_block = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  subnet_priv_cidr_block  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  
  ####### bastion node #############
  bastion_node_count = 0
  bastion_disk_size = 20
  bastion_instance_type = "t2.medium"

  # 1k
  
  #### KUBERNETES #######
  eks_version = 1.26
  eks_endpoint_public_access = true
  eks_endpoint_private_access = false

  webservice_node_pool_count = 1
  webservice_node_pool_max_count = 3
  webservice_node_pool_min_count = 1
  webservice_node_pool_disk_size = 30
  webservice_node_pool_instance_type = "t3a.medium"

  sidekiq_node_pool_max_count = 2
  sidekiq_node_pool_count = 1
  sidekiq_node_pool_min_count = 1
  sidekiq_node_pool_instance_type = "t3a.medium"
  sidekiq_node_pool_disk_size = 30
  
  supporting_node_pool_count = 1
  supporting_node_pool_disk_size = 30
  supporting_node_pool_instance_type = "t3a.medium"
  supporting_node_pool_min_count = 1
  supporting_node_pool_max_count = 3
   ### addons ##
  eks_kube_proxy_version = "latest"
  eks_coredns_version = "latest"
  eks_vpc_cni_version = "latest"
  eks_ebs_csi_driver_version = "latest"


  ##### S3 BUCKETS ###################
  object_storage_buckets = ["artifacts", "backups", "lfs", "mr-diffs", "uploads", "registry"] 

  ##### praefect node ################
  praefect_node_count=2
  praefect_instance_type ="t3a.medium"
  praefect_disk_size = 30

  ##### gitaly node ################
  gitaly_node_count = 1
  gitaly_instance_type = "t3a.medium"
  gitaly_disk_size = 20

  ######  elb_internal #############
  elb_internal_create = true

  ####### AWS RDS  #################
  rds_postgres_instance_type = "m5d.large"
  rds_postgres_version ="14.7"
  rds_postgres_multi_az = false
  rds_postgres_iops = 1000
  rds_postgres_storage_type = "io1"
  rds_postgres_port = 5432
  rds_postgres_database_name = "gitlabhq_production"
  rds_postgres_username = "gitlab"
  rds_postgres_password  = "KM6vEMe8hgFa"
  rds_postgres_allocated_storage = 100
  rds_postgres_max_allocated_storage = 200
  rds_postgres_auto_minor_version_upgrade = false
  rds_postgres_read_replica_count = 0
  rds_postgres_replication_database_arn = null
  rds_postgres_read_replica_port = 5432
  rds_postgres_read_replica_multi_az = false
  performance_insights_enabled = true

 ###### elastic cache ##############
 elasticache_redis_node_count = 1
 #elasticache_redis_cache_node_count = 1
 #elasticache_redis_persistent_node_count = 1
 elasticache_redis_instance_type = "t2.micro"
 elasticache_redis_engine_version = "7.0"
 elasticache_redis_port = 6379
 elasticache_redis_multi_az = false
 elasticache_redis_password = "poornima123456789"
#  elasticache_redis_cache_password = "poornima123456789"
#  elasticache_redis_persistent_password = "poornima123456789"
#  elasticache_redis_persistent_instance_type = "t2.micro"
#  elasticache_redis_persistent_engine_version = "7.0"
#  elasticache_redis_persistent_port = 6379
#  elasticache_redis_persistent_multi_az = false
#  elasticache_redis_cache_engine_version = "6.x"
#  elasticache_redis_cache_instance_type = "t2.micro"

#praefect postgres
praefect_postgres_node_count = 1
praefect_postgres_instance_type = "t2.medium"
}


output "gitlab_ref_arch_aws" {
  value = module.gitlab_ref_arch_aws
}
