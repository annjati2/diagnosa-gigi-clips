(defrule Start
	=> 
	(printout t "Apakah anda ingin melakukan diagnosis?" crlf 
	"1: Ya" crlf
	"0: Tidak" crlf)
	(bind ?x (read))
	(assert(program-mulai ?x))
)

(defrule first-diagnosis
	(program-mulai ?angka) 
	=> 
	(if(= ?angka 1)
		then
		(printout t "Apakah gigi anda berlubang?" crlf
		"1: Ya" crlf
		"0: Tidak" crlf)
		(assert(Gigi Lubang (read)))
	)
	(if(= ?angka 0)
		then(printout t "Terima kasih sudah menggunakan program kami")
	)
)

(defrule apakah-berlubang
	(Gigi Lubang ?angka)
	=>
	(if(= ?angka 1)
		then
		(printout t "Apakah warna gigi anda hitam?" crlf
		"1: Ya" crlf
		"0: Tidak" crlf)
		(assert(Gigi Hitam (read)))
	)
	(if(= ?angka 0)
		then
		(printout t "Apakah terdapat karang gigi?" crlf
		"1: Ya" crlf
		"0: Tidak" crlf
		)
		(assert(Karang Gigi (read)))
	)
) 

(defrule apakah-hitam
	(Gigi Hitam ?angka)
	=>
	(if(= ?angka 1)
		then
		(printout t "Apakah anda merasakan ngilu pada gigi anda?"
		"1: Ya" crlf
		"0: Tidak" crlf)
		(assert(Rasa Ngilu (read)))
	)
	(if(= ?angka 0)
		then
		(printout t "Sepertinya anda tidak terkena penyakit gigi apapun, tetapi masih ada kemungkinan anda terdiagnosis karies" crlf)
	)
)

(defrule apakah-adaKarang
	(Karang Gigi ?angka)
	=>
	(if(= ?angka 1)
		then
		(printout t "Apakah ada bau mulut yang berlebihan?" crlf
		"1: Ya" crlf
		"0: Tidak" crlf)
		(assert(Bau Mulut (read)))
	)
	(if(= ?angka 0)
		then
		(printout t "Apakah anda mengalami gusi bengkak?" crlf
		"1: Ya" crlf
		"0: Tidak" crlf)
		(assert(Gusi Bengkak (read)))
	)
)

(defrule apakah-ngilu
	(Rasa Ngilu ?angka)
	=>
	(if(= ?angka 1)
		then
		(printout t "Apakah ada bau mulut yang berlebihan?" crlf
		"1: Ya" crlf
		"0: Tidak" crlf)
		(assert(Terdiagnosis (read) karies))
	)
	(if(= ?angka 0)
		then
		(printout t "Sepertinya anda tidak terkena penyakit gigi apapun, tetapi masih ada kemungkinan anda terdiagnosis karies" crlf)
	)
)

(defrule apakah-bau
	(Bau Mulut ?angka)
	=>
	(if(= ?angka 1)
		then
		(printout t "Apakah anda merasakan gusi bengkak?" crlf
		"1: Ya" crlf
		"0: Tidak" crlf)
		(assert(Terdiagnosis (read) calculus))
	)
	(if(= ?angka 0)
		then
		(printout t "Sepertinya anda tidak terkena penyakit gigi apapun, tetapi masih ada kemungkinan anda terdiagnosis calculus" crlf)
	)
)

(defrule apakah-bengkak
	(Gusi Bengkak ?angka)
	=>
	(if(= ?angka 1)
		then
		(printout t "Apakah muncul nanah pada mulut?" crlf
		"1: Ya" crlf
		"0: Tidak" crlf)
		(assert(Muncul Nanah (read)))
	)
	(if(= ?angka 0)
		then
		(printout t "Sepertinya anda tidak terkena penyakit gigi apapun, tetapi masih ada kemungkinan anda terdiagnosis sariawan atau mengalami radang gusi" crlf)
	)
)

(defrule apakah-bernanah
	(Muncul Nanah ?angka)
	=>
	(if(= ?angka 1)
		then
		(printout t "Apakah terdapat luka?" crlf
		"1: Ya" crlf
		"0: Tidak" crlf)
		(assert(Terdiagnosis (read) sariawan))
	)
	(if(= ?angka 0)
		then
		(printout t "Apakah gusi berwarna merah?" crlf
		"1: Ya" crlf
		"0: Tidak" crlf)
		(assert(Gusi Merah (read)))
	)
)

(defrule apakah-merah
	(Gusi Merah ?angka)
	=> 
	(if(= ?angka 1)
		then
		(printout t "Apakah gusi berdarah ketika sikat gigi?" crlf
		"1: Ya" crlf
		"0: Tidak" crlf)
		(assert(Terdiagnosis (read) radang-gusi))
	)
	(if(= ?angka 0)
		then
		(printout t "Sepertinya anda tidak terkena penyakit gigi apapun, tetapi masih ada kemungkinan anda terdiagnosis radang gusi" crlf)
	)
)
	
(defrule hasil-diagnosa
	(Terdiagnosis 1 ?penyakit)
	=>
	(printout t "Sepertinya anda terdiagnosis penyakit " ?penyakit crlf)
)

(defrule kemungkinan-terdiagnosa
	(Terdiagnosis 0 ?penyakit)
	=>
	(printout t "Ada kemungkinan anda terdiagnosis penyakit " ?penyakit crlf)
)
