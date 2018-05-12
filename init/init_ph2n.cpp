/*
   Copyright (c) 2017-2018, The Linux Foundation. All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
	* Redistributions of source code must retain the above copyright
	  notice, this list of conditions and the following disclaimer.
	* Redistributions in binary form must reproduce the above
	  copyright notice, this list of conditions and the following
	  disclaimer in the documentation and/or other materials provided
	  with the distribution.
	* Neither the name of The Linux Foundation nor the names of its
	  contributors may be used to endorse or promote products derived
	  from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <init_sd4xx.h>

void init_target_properties(void)
{
	char *bootloader_str = NULL;
	char *build_id = NULL;
	char *device = NULL;
	char *model = NULL;
	char *name = NULL;
	char *operator_alpha = NULL;
	char *operator_numeric = NULL;
	char *version_release = NULL;
	char *ranstring = NULL;
	char *brand = NULL;
	char *vendor = NULL;

	int network_type = 1;

	/* get the bootloader string */
	std::string bootloader = property_get("ro.bootloader");

	if (bootloader.find("LGM") == 0) {
		build_id = (char *)"NRD90U";
		device = (char *)"ph2n";
		name = (char *)"ph2n_mpcs_us";
		model = (char *)"LG-M550";
		version_release = (char *)"7.0";
		ranstring = (char *)"1809419052a15";
		brand = (char *)"MetroPCS";
		vendor = (char *)"lge";
		network_type=GSM_DEVICE;
	}
	else if (bootloader.find("LGK") == 0) {
		build_id = (char *)"NRD90U";
		device = (char *)"ph2n";
		name = (char *)"ph2n_tmo_us";
		model = (char *)"LG-K550";
		version_release = (char *)"7.0";
		ranstring = (char *)"172862202aea7";
		brand = (char *)"lge";
		vendor = (char *)"lge";
		network_type=GSM_DEVICE;
	}
	else {
		return;
	}

	/* set the properties */
	set_target_properties(build_id, bootloader_str, name, device, model,
		       network_type, operator_alpha, operator_numeric, version_release, ranstring, brand, vendor);
}