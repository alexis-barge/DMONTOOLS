CDF      
      time_counter       x         y         gdept      .         history      }Fri Jun 25 16:35:31 2010: ncatted -O -a time_origin,time_counter,o,c,A.D. ORCA025-G70_TSMEAN.nc
Fri Jun 25 16:35:31 2010: ncatted -O -a units,time_counter,o,c,years ORCA025-G70_TSMEAN.nc
Fri Jun 25 16:35:31 2010: ncap -F -O -s time_counter = (time_counter / 31536000 ) + 1958 ORCA025-G70_TSMEAN.nc ORCA025-G70_TSMEAN.nc
Fri Jun 25 16:35:31 2010: ncks -F --append -v mean_3Dsossheig ORCA025-G70_SSHMEAN.nc -o ORCA025-G70_TSMEAN.nc
Fri Jun 25 16:35:31 2010: ncks -F --append -v mean_sossheig ORCA025-G70_SSHMEAN.nc -o ORCA025-G70_TSMEAN.nc
Fri Jun 25 16:35:31 2010: ncks -F --append -v mean_3Dvosaline ORCA025-G70_SMEAN.nc -o ORCA025-G70_TSMEAN.nc
Fri Jun 25 16:35:31 2010: ncks -F --append -v mean_vosaline ORCA025-G70_SMEAN.nc -o ORCA025-G70_TSMEAN.nc
Fri Jun 25 16:35:31 2010: ncrcat -O ORCA025-G70_y2002_TMEAN.nc ORCA025-G70_y2003_TMEAN.nc ORCA025-G70_y2004_TMEAN.nc -o ORCA025-G70_TMEAN.nc       nco_openmp_thread_number            NCO       	20100625          
   time_counter                units         years      time_origin       A.D.            T   nav_lon                   units         degrees_east   	valid_min         �4     	valid_max         C4     	long_name         	Longitude      	nav_model         Default grid        �   nav_lat                   units         degrees_north      	valid_min         ´     	valid_max         B�     	long_name         Latitude   	nav_model         Default grid        �   gdept                       �  �   mean_votemper                            units         C      missing_value         G�O�   	valid_min         �z     	valid_max         Dz     	long_name         mean_Potential_Temperature     
short_name        mean_votemper      online_operation      N/A    axis      T      scale_factor      ?�     
add_offset               	savelog10                   �  X   mean_3Dvotemper                       units         C      missing_value         G�O�   	valid_min         �z     	valid_max         Dz     	long_name         mean_3DPotential_Temperature   
short_name        mean_3Dvotemper    online_operation      N/A    axis      T      scale_factor      ?�     
add_offset               	savelog10                        mean_vosaline                            units         PSU    missing_value         G�O�   	valid_min         �z     	valid_max         Dz     	long_name         mean_Salinity      
short_name        mean_vosaline      online_operation      N/A    axis      T      scale_factor      ?�     
add_offset               	savelog10                   �     mean_3Dvosaline                       units         PSU    missing_value         G�O�   	valid_min         �z     	valid_max         Dz     	long_name         mean_3DSalinity    
short_name        mean_3Dvosaline    online_operation      N/A    axis      T      scale_factor      ?�     
add_offset               	savelog10                     �   mean_sossheig                            units         m      missing_value         G�O�   	valid_min         �z     	valid_max         Dz     	long_name         mean_Sea_Surface_height    
short_name        mean_sossheig      online_operation      N/A    axis      T      scale_factor      ?�     
add_offset               	savelog10                   �  �   mean_3Dsossheig                       units         m      missing_value         G�O�   	valid_min         �z     	valid_max         Dz     	long_name         mean_3DSea_Surface_height      
short_name        mean_3Dsossheig    online_operation      N/A    axis      T      scale_factor      ?�     
add_offset               	savelog10                     �        @B�SAC�A��gA�0�B �PB%�kBO��B�&B�?�B�01B��%CHCC H�C?�Cc��C�r�C�*C�{C�8�D�CD��D7��DU�DwN�D��D�7.D�ܓD��D�K�E f�E�BEU�E)b"E7��EFYjEU,Ed+dEsO2E�H`E��<E���E�jmE�/ZE��jE�ǝE��!D�O�A���A�gzA�:A��A��qA��A�pA��A�vA.�Ar�gAdwAT�LAE)�A6-�A'Z�A��A	��@� �@�J@�b[@�� @��t@~j�@bJ=@Jr$@6-7@$��@��@	RQ?���?��O?�Bg?ƀP?�i�?���?�?�Zf?|�S?k]�?a�o?[�#?];�?k7.?p��G�O�@c|QB
j�B
s�B
�B
�B
��B,�Ba�B�ZB��B�aBTB)BIB��B�Bl�B+�B
��B
��B
s�B
M�B
;B
?�B
V�B
z�B
��B
�B
��B
��B
��B �BBrB
��B
�YB
��B
� B
�qB
�B
�B
�sB
��B
��B
��B
��G�O�B
�=>�n�|�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  >�n�D�o�A��2A��BA�S�A�յA�ųA��A�`A��+A�S{A��ArߺAd��AU0xAE��A6��A'�:A�A	��@�7m@�)~@�N�@��%@��4@~�@b�@JZ�@6.�@$�n@��@	^�?��?�?�Y�?Ɛ�?�u|?�
?�
�?�_�?|��?kx�?a�G?[��?]EV?k+?p�=G�O�@c�kB
d�B
ndB
�SB
�qB
�DB*�B^�B�@B�sB��B�B#�B�B��B��Bl�B+�B
��B
�[B
r�B
M7B
:�B
?B
VeB
z�B
��B
�VB
�B
�B
�B �B8B�B
�B
�lB
��B
�.B
�{B
�-B
�(B
�B
��B
�B
��B
�G�O�B
��>�*�|�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  >�*�D���A�REA�;A�ǟA�PqA�N�A��A�BAA��A��!A�T7AtJ�Ae�AV�AFi�A7�A(�ABA	��@�sj@�8s@�<@�z�@���@}��@a�@JNW@6.p@$�@��@	g�?�#�?�&�?�h3?Ơ
?��I?�*�?�,1?�wz?}
�?k��?aň?[Ǟ?]T?k??phG�O�@c��B
f�B
rB
��B
�\B
��B&�BX[B�B��B�B�B"B�B�IB�_BkXB*�B
��B
�{B
q�B
LSB
:'B
>TB
U�B
zSB
��B
��B
�KB
�,B
�4B �BFB�B
�B
�B
��B
�GB
��B
�8B
�5B
�B
�B
�B
��B
�/G�O�B
޺>�ZJ|�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  |�  >�ZJ