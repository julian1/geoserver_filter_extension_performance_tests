
require 'net/http'

a = [ 'imos:anmn_nrs_yon_dar_timeseries_map',
	'imos:soop_tmv_trajectory_map',
	'imos:soop_asf_mft_trajectory_map',
	'imos:abos_pulse_map',
	'imos:anmn_nrs_rt_bio_timeseries_map',
	'imos:srs_oc_soop_rad_trajectory_map',
	'imos:soop_xbt_nrt_profiles_map',
	'imos:faimms_timeseries_map',
	'imos:argo_profile_layer_map',
	'imos:aodn_nt_sattag_hawksbill_dive_profile_map',
	'imos:installation_summary',
	'imos:anmn_am_nrt_map',
	'imos:soop_co2_trajectory_map',
	'imos:soop_sst_dm_trajectory_map',
	'imos:abos_sots_map',
	'imos:anmn_nrs_rt_wave_timeseries_map',
	'imos:srs_altimetry_timeseries_map',
	'imos:anmn_ctd_profiles_map',
	'imos:anmn_ts_timeseries_map',
	'imos:abos_sofs_surfaceflux_rt_map',
	'imos:anmn_burst_avg_timeseries_map',
	'imos:anmn_am_dm_map',
	'imos:soop_trv_trajectory_map',
	'imos:aatams_biologging_shearwater_map',
	'imos:soop_ba_trajectory_map',
	'imos:soop_xbt_dm_profile_map',
	'imos:soop_asf_mt_trajectory_map',
	'imos:srs_oc_bodbaw_trajectory_profile_map',
	'imos:aodn_nt_sattag_hawksbill_summary_map',
	'imos:aodn_nt_sattag_hawksbill_location_map',
	'imos:abos_sofs_surfaceprop_rt_map',
	'imos:anfog_rt_trajectory_map',
	'imos:anmn_regridded_temperature_map',
	'imos:anmn_velocity_timeseries_map',
	'imos:auv_trajectory_map',
	'imos:abos_sofs_surfaceflux_dm_map',
	'imos:aatams_biologging_penguin_map',
	'imos:aatams_sattag_nrt_profile_map',
	'imos:anmn_mhlwave_map',
	'imos:abos_sofs_surfaceprop_dm_map',
	'imos:abos_ts_timeseries_map',
	'imos:soop_auscpr_phyto_trajectory_map',
	'imos:soop_auscpr_zoop_trajectory_map',
	'imos:anmn_nrs_bgc_plankton_biomass_map',
	'imos:anmn_nrs_bgc_plankton_zooplankton_map',
	'imos:anfog_dm_trajectory_map',
	'imos:aad_so_cpr_map',
	'imos:soop_sst_nrt_trajectory_map',
	'imos:aatams_sattag_dm_profile_map',
	'imos:soop_tmv_nrt_trajectory_map',
	'imos:anmn_nrs_bgc_plankton_phytoplankton_map',
	'imos:soop_auscpr_pci_trajectory_map',
	'imos:noaa_drifters_map',
	'imos:anmn_acoustics',
	'imos:anmn_nrs_rt_meteo_timeseries_map',
	'imos:anmn_nrs_bgc_tss_secchi_map',
	'imos:anmn_nrs_bgc_phypig_map',
	'imos:abos_currents_map',
	'imos:aodn_nt_sattag_hawksbill_haulout_map',
	'imos:anmn_nrs_bgc_picoplankton_map',
	'imos:anmn_nrs_bgc_chemistry_map'
];

a.each do |x|
	workspace,layer = x.split(':')

	
	query = "http://localhost:8080/geoserver/wms?request=enabledFilters&service=layerFilters&version=1.0.0&workspace=#{ workspace }&layer=#{layer}"
	t = Time.now 
	# puts query
	begin	
		result = Net::HTTP.get( URI.parse( query  ))
		puts "#{ ( Time.now - t).round( 2) }  #{ layer }"
	rescue Exception => e 
		puts "#{ ( Time.now - t).round( 2) } #{ e } #{ layer }"
	end
end



