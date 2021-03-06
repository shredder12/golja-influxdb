class influxdb::server (
  $ensure                                       = $influxdb::params::ensure,
  $version                                      = $influxdb::params::version,
  $config_file                                  = $influxdb::params::config_file,
  $service_provider                             = $influxdb::params::service_provider,
  $service_enabled                              = $influxdb::params::service_enabled,
  $package_provider                             = $influxdb::params::package_provider,
  $hostname                                     = undef,
  $bind_address                                 = $influxdb::params::bind_address,
  $reporting_disabled                           = $influxdb::params::reporting_disabled,
  $retention_autocreate                         = $influxdb::params::retention_autocreate,
  $election_timeout                             = $influxdb::params::election_timeout,
  $heartbeat_timeout                            = $influxdb::params::heartbeat_timeout,
  $leader_lease_timeout                         = $influxdb::params::leader_lease_timeout,
  $commit_timeout                               = $influxdb::params::commit_timeout,
  $data_dir                                     = $influxdb::params::data_dir,
  $wal_dir                                      = $influxdb::params::wal_dir,
  $meta_dir                                     = $influxdb::params::meta_dir,
  $wal_enable_logging                           = $influxdb::params::wal_enable_logging,
  $wal_ready_series_size                        = $influxdb::params::wal_ready_series_size,
  $wal_compaction_threshold                     = $influxdb::params::wal_compaction_threshold,
  $wal_max_series_size                          = $influxdb::params::wal_max_series_size,
  $wal_flush_cold_interval                      = $influxdb::params::wal_flush_cold_interval,
  $wal_partition_size_threshold                 = $influxdb::params::wal_partition_size_threshold,
  $max_wal_size                                 = $influxdb::params::max_wal_size,
  $wal_flush_interval                           = $influxdb::params::wal_flush_interval,
  $wal_partition_flush_delay                    = $influxdb::params::wal_partition_flush_delay,
  $shard_writer_timeout                         = $influxdb::params::shard_writer_timeout,
  $cluster_write_timeout                        = $influxdb::params::cluster_write_timeout,
  $retention_enabled                            = $influxdb::params::retention_enabled,
  $retention_check_interval                     = $influxdb::params::retention_check_interval,
  $admin_enabled                                = $influxdb::params::admin_enabled,
  $admin_bind_address                           = $influxdb::params::admin_bind_address,
  $admin_https_enabled                          = $influxdb::params::admin_https_enabled,
  $admin_https_certificate                      = $influxdb::params::admin_https_certificate,
  $http_enabled                                 = $influxdb::params::http_enabled,
  $http_bind_address                            = $influxdb::params::http_bind_address,
  $http_auth_enabled                            = $influxdb::params::http_auth_enabled,
  $http_log_enabled                             = $influxdb::params::http_log_enabled,
  $http_write_tracing                           = $influxdb::params::http_write_tracing,
  $http_pprof_enabled                           = $influxdb::params::http_pprof_enabled,
  $http_https_enabled                           = $influxdb::params::http_https_enabled,
  $http_https_certificate                       = $influxdb::params::http_https_certificate,
  $graphite_enabled                             = $influxdb::params::graphite_enabled,
  $graphite_bind_address                        = $influxdb::params::graphite_bind_address,
  $graphite_protocol                            = $influxdb::params::graphite_protocol,
  $graphite_consistency_level                   = $influxdb::params::graphite_consistency_level,
  $graphite_separator                           = $influxdb::params::graphite_separator,
  $graphite_tags                                = $influxdb::params::graphite_tags,
  $graphite_templates                           = $influxdb::params::graphite_templates,
  $graphite_ignore_unnamed                      = $influxdb::params::graphite_ignore_unnamed,
  $collectd_enabled                             = $influxdb::params::collectd_enabled,
  $collectd_bind_address                        = $influxdb::params::collectd_bind_address,
  $collectd_database                            = $influxdb::params::collectd_database,
  $collectd_typesdb                             = $influxdb::params::collectd_typesdb,
  $opentsdb_enabled                             = $influxdb::params::opentsdb_enabled,
  $opentsdb_bind_address                        = $influxdb::params::opentsdb_bind_address,
  $opentsdb_database                            = $influxdb::params::opentsdb_database,
  $opentsdb_retention_policy                    = $influxdb::params::opentsdb_retention_policy,
  $udp_options                                  = $influxdb::params::udp_options,
  $monitoring_enabled                           = $influxdb::params::monitoring_enabled,
  $monitoring_write_interval                    = $influxdb::params::monitoring_write_interval,
  $continuous_queries_enabled                   = $influxdb::params::continuous_queries_enabled,
  $continuous_queries_recompute_previous_n      = $influxdb::params::continuous_queries_recompute_previous_n,
  $continuous_queries_recompute_no_older_than   = $influxdb::params::continuous_queries_recompute_no_older_than,
  $continuous_queries_compute_runs_per_interval = $influxdb::params::continuous_queries_compute_runs_per_interval,
  $continuous_queries_compute_no_more_than      = $influxdb::params::continuous_queries_compute_no_more_than,
  $hinted_handoff_enabled                       = $influxdb::params::hinted_handoff_enabled,
  $hinted_handoff_dir                           = $influxdb::params::hinted_handoff_dir,
  $hinted_handoff_max_size                      = $influxdb::params::hinted_handoff_max_size,
  $hinted_handoff_max_age                       = $influxdb::params::hinted_handoff_max_age,
  $hinted_handoff_retry_rate_limit              = $influxdb::params::hinted_handoff_retry_rate_limit,
  $hinted_handoff_retry_interval                = $influxdb::params::hinted_handoff_retry_interval,
  $conf_template                                = $influxdb::params::conf_template,
  $influxdb_user                                = $influxdb::params::influxdb_user,
  $influxdb_group                               = $influxdb::params::influxdb_group,
  $enable_snapshot                              = $influxdb::params::enable_snapshot,
  $influxdb_stderr_log                          = $influxdb::params::influxdb_stderr_log,
  $influxdb_stdout_log                          = $influxdb::params::influxdb_stdout_log,
  $influxd_opts                                 = $influxdb::params::influxd_opts,
  $manage_install                               = $influxdb::params::manage_install,
  $cfg                                          = $influxdb::params::cfg,
) inherits influxdb::params {

  if ! ($ensure in ['present','absent']) {
    fail("Wrong value for ensure ${ensure}. Valid values present or absent")
  }

  anchor { 'influxdb::server::start': }->
  class { 'influxdb::server::install': }->
  class { 'influxdb::server::config': }->
  class { 'influxdb::server::service': }->
  anchor { 'influxdb::server::end': }

}
