#----------------------------------------------------------------------------
#  Copyright (c) 2016 WSO2, Inc. http://www.wso2.org
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#----------------------------------------------------------------------------

define wso2base::configure_idp_service_providers($carbon_home, $owner, $group, $wso2_module) {

  $template_path = 'repository/conf/identity/service-providers'

  ensure_resource('file', "${carbon_home}/${template_path}/${name}.xml", {
    ensure  => file,
    owner   => $owner,
    group   => $group,
    mode    => '0755',
    content => template("${wso2_module}/${template_path}/service_provider_template.xml.erb")
  })
}
