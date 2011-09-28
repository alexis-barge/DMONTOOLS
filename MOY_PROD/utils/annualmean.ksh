#!/bin/ksh

CONFIG=$1
CASE=$2
YEAR=$3
TYP=$4

if [ $# != 4 ] ; then 
   echo 'USAGE : annualmean.ksh CONFIG CASE YEAR TYP '
   exit
fi

CONFCASE=$CONFIG-$CASE

INDIR=$SDIR/$CONFIG/$CONFCASE-MEAN/$YEAR
#CDF=$WORKDIR/CDFTOOLS_forge/bin # if cdftools are not in your path define this

if [ ! -d $INDIR ] ; then echo "le repertoire $INDIR n existe pas..." ; exit ; fi

listfiles=$( ls $INDIR | grep y${YEAR}m | grep ${TYP}.nc | grep $CONFCASE )

for file in $listfiles ; do

    mfget $INDIR/$file

done

echo "$listfiles have been downloaded"

#$CDF/cdfmoy_weighted $listfiles # if cdftools are not in your path uncomment this
cdfmoy_weighted $listfiles       # if cdftools are not in your path comment this

mv cdfmoy_weighted.nc ${CONFCASE}_y${YEAR}_$TYP.nc
    
