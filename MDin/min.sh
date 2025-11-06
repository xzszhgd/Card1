EXEMIN="mpirun -np 4 sander.MPI"
EXEMIN="sander"


PRMTOP=start.prmtop
INPCRD=start.inpcrd
INPFILE=../../4-in

OLD="$INPCRD"
NEW=min
$EXEMIN -O -i ${INPFILE}/$NEW.in -o $NEW.out -p $PRMTOP -c $OLD -r $NEW.restrt -ref $INPCRD

OLD=${NEW}.restrt
NEW=min2
$EXEMIN -O -i ${INPFILE}/$NEW.in -o $NEW.out -p $PRMTOP -c $OLD -r $NEW.restrt -ref $INPCRD

export CUDA_VISIBLE_DEVICES='0'
export EXEMIN="pmemd.cuda"

OLD=${NEW}.restrt
NEW=heat
$EXEMIN -O -i ${INPFILE}/$NEW.in -o $NEW.out -p $PRMTOP -c $OLD -r $NEW.restrt -ref $INPCRD -x $NEW.mdcrd

OLD=${NEW}.restrt
NEW=density
$EXEMIN -O -i ${INPFILE}/$NEW.in -o $NEW.out -p $PRMTOP -c $OLD -r $NEW.restrt -ref $INPCRD -x $NEW.mdcrd






