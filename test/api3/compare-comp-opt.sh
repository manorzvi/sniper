O=$1

echo "[I] Running with O${O} optimization"

#echo "[I] mkdir api-O${O} ; mv api-O${O} ..."
#          mkdir api-O${O} ; mv api-O${O}
#echo "[I] ... done."

echo "[I] make clean"
         make clean

echo "[I] cc api.c -O${O} -o api-O${O}"
          cc api.c -O${O} -o api-O${O}

echo "[I] chmod +x api-O${O}"
          chmod +x api-O${O}

#echo "[I] ../../record-trace -o api-O${O}-sift -- api-O${O}"
#          ../../record-trace -o api-O${O}-sift -- api-O${O}

echo "[I] objdump -d api-O${O} > api-O${O}.objdump"
          objdump -d api-O${O} > api-O${O}.objdump

#echo "[I] ../../record-trace -o api-O${O} -- api-O${O}"
# 	  ../../record-trace -o api-O${O} -- api-O${O}

echo "[I] mkdir api-O${O}-dir ; chmod 777 api-O${O}-dir"
          mkdir api-O${O}-dir ; chmod 777 api-O${O}-dir

echo "[I] ../../run-sniper -n 1 -d api-O${O}-dir -- ./api-O${O}"
          ../../run-sniper -n 1 -d api-O${O}-dir -- ./api-O${O}

echo "[I] cd api-O${O}-dir"
          cd api-O${O}-dir

echo "[I] ../../../tools/cpistack.py -o api-O${O}-cpistack"
          ../../../tools/cpistack.py -o api-O${O}-cpistack

echo "[I] ../../../tools/mcpat.py -o api-O${O}-mcpat"
	  ../../../tools/mcpat.py -o api-O${O}-mcpat

echo "[I] ../../../tools/dumpstats.py > api-O${O}-dumpstats.txt"
          ../../../tools/dumpstats.py > api-O${O}-dumpstats.txt

echo "[I] cd ../../../"
          cd ../../../

echo "[I] ./record-trace -o api-O${O} -- test/api3/api-O${O}"
          ./record-trace -o api-O${O} -- test/api3/api-O${O}

echo "[I] cd test/api3"
          cd test/api3
