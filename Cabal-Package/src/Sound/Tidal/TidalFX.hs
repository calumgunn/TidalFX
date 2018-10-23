module Sound.Tidal.TidalFX where

import Sound.Tidal.Context

-- Waveloss: drop n (int) samples from every 100
waveloss :: Pattern Int -> ParamPattern
waveloss = make' VI waveloss_p
waveloss_p = I "waveloss" Nothing
