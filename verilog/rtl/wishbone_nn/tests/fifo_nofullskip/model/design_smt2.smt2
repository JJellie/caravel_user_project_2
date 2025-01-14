; SMT-LIBv2 description generated by Yosys 0.45+139 (git sha1 4d581a97d, clang++ 14.0.0-1ubuntu1.1 -fPIC -O3)
; yosys-smt2-module fifo_buffer
(declare-sort |fifo_buffer_s| 0)
(declare-fun |fifo_buffer_is| (|fifo_buffer_s|) Bool)
(declare-fun |fifo_buffer#0| (|fifo_buffer_s|) (_ BitVec 1)) ; \rst
(define-fun |fifo_buffer#1| ((state |fifo_buffer_s|)) (_ BitVec 1) (ite (= ((_ extract 0 0) (|fifo_buffer#0| state)) #b1) #b0 #b1)) ; \count_bound_EN
; yosys-smt2-wire write_addr_change_EN 1
(define-fun |fifo_buffer_n write_addr_change_EN| ((state |fifo_buffer_s|)) Bool (= ((_ extract 0 0) (|fifo_buffer#1| state)) #b1))
; yosys-smt2-witness {"offset": 0, "path": ["\\write_addr"], "smtname": 2, "smtoffset": 0, "type": "reg", "width": 3}
(declare-fun |fifo_buffer#2| (|fifo_buffer_s|) (_ BitVec 3)) ; \write_addr
; yosys-smt2-register write_addr 3
; yosys-smt2-wire write_addr 3
(define-fun |fifo_buffer_n write_addr| ((state |fifo_buffer_s|)) (_ BitVec 3) (|fifo_buffer#2| state))
(declare-fun |fifo_buffer#3| (|fifo_buffer_s|) Bool) ; \we
; yosys-smt2-input we 1
; yosys-smt2-wire we 1
; yosys-smt2-witness {"offset": 0, "path": ["\\we"], "smtname": "we", "smtoffset": 0, "type": "input", "width": 1}
(define-fun |fifo_buffer_n we| ((state |fifo_buffer_s|)) Bool (|fifo_buffer#3| state))
; yosys-smt2-wire w_addr_bound_EN 1
(define-fun |fifo_buffer_n w_addr_bound_EN| ((state |fifo_buffer_s|)) Bool (= ((_ extract 0 0) (|fifo_buffer#1| state)) #b1))
; yosys-smt2-input rst 1
; yosys-smt2-wire rst 1
; yosys-smt2-witness {"offset": 0, "path": ["\\rst"], "smtname": "rst", "smtoffset": 0, "type": "input", "width": 1}
(define-fun |fifo_buffer_n rst| ((state |fifo_buffer_s|)) Bool (= ((_ extract 0 0) (|fifo_buffer#0| state)) #b1))
; yosys-smt2-wire read_addr_change_EN 1
(define-fun |fifo_buffer_n read_addr_change_EN| ((state |fifo_buffer_s|)) Bool (= ((_ extract 0 0) (|fifo_buffer#1| state)) #b1))
; yosys-smt2-witness {"offset": 0, "path": ["\\read_addr"], "smtname": 4, "smtoffset": 0, "type": "reg", "width": 3}
(declare-fun |fifo_buffer#4| (|fifo_buffer_s|) (_ BitVec 3)) ; \read_addr
; yosys-smt2-register read_addr 3
; yosys-smt2-wire read_addr 3
(define-fun |fifo_buffer_n read_addr| ((state |fifo_buffer_s|)) (_ BitVec 3) (|fifo_buffer#4| state))
; yosys-smt2-wire r_addr_bound_EN 1
(define-fun |fifo_buffer_n r_addr_bound_EN| ((state |fifo_buffer_s|)) Bool (= ((_ extract 0 0) (|fifo_buffer#1| state)) #b1))
; yosys-smt2-output full 1
; yosys-smt2-wire full 1
(define-fun |fifo_buffer_n full| ((state |fifo_buffer_s|)) Bool false)
; yosys-smt2-memory FIFO 3 32 1 1 sync
; yosys-smt2-witness {"path": ["\\FIFO"], "rom": false, "size": 8, "smtname": "FIFO", "statebv": false, "type": "mem", "uninitialized": [{"offset": 0, "width": 256}], "width": 32}
(declare-fun |fifo_buffer#5#0| (|fifo_buffer_s|) (Array (_ BitVec 3) (_ BitVec 32))) ; FIFO
(define-fun |fifo_buffer_m FIFO| ((state |fifo_buffer_s|)) (Array (_ BitVec 3) (_ BitVec 32)) (|fifo_buffer#5#0| state))
(define-fun |fifo_buffer_m:R0A FIFO| ((state |fifo_buffer_s|)) (_ BitVec 3) (|fifo_buffer#4| state)) ; \read_addr
(define-fun |fifo_buffer#6| ((state |fifo_buffer_s|)) (_ BitVec 32) (select (|fifo_buffer#5#0| state) (|fifo_buffer_m:R0A FIFO| state))) ; $memrd$\FIFO$input_fifo.sv:25$11_DATA
(define-fun |fifo_buffer_m:R0D FIFO| ((state |fifo_buffer_s|)) (_ BitVec 32) (|fifo_buffer#6| state))
(declare-fun |fifo_buffer#7| (|fifo_buffer_s|) (_ BitVec 1)) ; \ce
(define-fun |fifo_buffer#8| ((state |fifo_buffer_s|)) (_ BitVec 32) (ite (= ((_ extract 0 0) (|fifo_buffer#7| state)) #b1) (|fifo_buffer#6| state) #b00000000000000000000000000000000)) ; \data_o
; yosys-smt2-output data_o 32
; yosys-smt2-wire data_o 32
(define-fun |fifo_buffer_n data_o| ((state |fifo_buffer_s|)) (_ BitVec 32) (|fifo_buffer#8| state))
(declare-fun |fifo_buffer#9| (|fifo_buffer_s|) (_ BitVec 32)) ; \data_i
; yosys-smt2-input data_i 32
; yosys-smt2-wire data_i 32
; yosys-smt2-witness {"offset": 0, "path": ["\\data_i"], "smtname": "data_i", "smtoffset": 0, "type": "input", "width": 32}
(define-fun |fifo_buffer_n data_i| ((state |fifo_buffer_s|)) (_ BitVec 32) (|fifo_buffer#9| state))
; yosys-smt2-wire count_change_EN 1
(define-fun |fifo_buffer_n count_change_EN| ((state |fifo_buffer_s|)) Bool (= ((_ extract 0 0) (|fifo_buffer#1| state)) #b1))
; yosys-smt2-wire count_bound_EN 1
(define-fun |fifo_buffer_n count_bound_EN| ((state |fifo_buffer_s|)) Bool (= ((_ extract 0 0) (|fifo_buffer#1| state)) #b1))
; yosys-smt2-witness {"offset": 0, "path": ["\\count"], "smtname": 10, "smtoffset": 0, "type": "reg", "width": 3}
(declare-fun |fifo_buffer#10| (|fifo_buffer_s|) (_ BitVec 3)) ; \count
; yosys-smt2-register count 3
; yosys-smt2-wire count 3
(define-fun |fifo_buffer_n count| ((state |fifo_buffer_s|)) (_ BitVec 3) (|fifo_buffer#10| state))
(declare-fun |fifo_buffer#11| (|fifo_buffer_s|) Bool) ; \clk
; yosys-smt2-input clk 1
; yosys-smt2-wire clk 1
; yosys-smt2-clock clk posedge
; yosys-smt2-witness {"offset": 0, "path": ["\\clk"], "smtname": "clk", "smtoffset": 0, "type": "posedge", "width": 1}
; yosys-smt2-witness {"offset": 0, "path": ["\\clk"], "smtname": "clk", "smtoffset": 0, "type": "input", "width": 1}
(define-fun |fifo_buffer_n clk| ((state |fifo_buffer_s|)) Bool (|fifo_buffer#11| state))
; yosys-smt2-input ce 1
; yosys-smt2-wire ce 1
; yosys-smt2-witness {"offset": 0, "path": ["\\ce"], "smtname": "ce", "smtoffset": 0, "type": "input", "width": 1}
(define-fun |fifo_buffer_n ce| ((state |fifo_buffer_s|)) Bool (= ((_ extract 0 0) (|fifo_buffer#7| state)) #b1))
; yosys-smt2-anyseq fifo_buffer#12 3 $auto$setundef.cc:533:execute$364
; yosys-smt2-witness {"offset": 0, "path": ["\\_witness_", "\\anyseq_auto_setundef_cc_533_execute_364"], "smtname": 12, "smtoffset": 0, "type": "seq", "width": 3}
(declare-fun |fifo_buffer#12| (|fifo_buffer_s|) (_ BitVec 3)) ; \_witness_.anyseq_auto_setundef_cc_533_execute_364
; yosys-smt2-wire _witness_.anyseq_auto_setundef_cc_533_execute_364 3
(define-fun |fifo_buffer_n _witness_.anyseq_auto_setundef_cc_533_execute_364| ((state |fifo_buffer_s|)) (_ BitVec 3) (|fifo_buffer#12| state))
; yosys-smt2-anyseq fifo_buffer#13 32 $auto$setundef.cc:533:execute$362
; yosys-smt2-witness {"offset": 0, "path": ["\\_witness_", "\\anyseq_auto_setundef_cc_533_execute_362"], "smtname": 13, "smtoffset": 0, "type": "seq", "width": 32}
(declare-fun |fifo_buffer#13| (|fifo_buffer_s|) (_ BitVec 32)) ; \_witness_.anyseq_auto_setundef_cc_533_execute_362
; yosys-smt2-wire _witness_.anyseq_auto_setundef_cc_533_execute_362 32
(define-fun |fifo_buffer_n _witness_.anyseq_auto_setundef_cc_533_execute_362| ((state |fifo_buffer_s|)) (_ BitVec 32) (|fifo_buffer#13| state))
; yosys-smt2-anyseq fifo_buffer#14 3 $auto$setundef.cc:533:execute$360
; yosys-smt2-witness {"offset": 0, "path": ["\\_witness_", "\\anyseq_auto_setundef_cc_533_execute_360"], "smtname": 14, "smtoffset": 0, "type": "seq", "width": 3}
(declare-fun |fifo_buffer#14| (|fifo_buffer_s|) (_ BitVec 3)) ; \_witness_.anyseq_auto_setundef_cc_533_execute_360
; yosys-smt2-wire _witness_.anyseq_auto_setundef_cc_533_execute_360 3
(define-fun |fifo_buffer_n _witness_.anyseq_auto_setundef_cc_533_execute_360| ((state |fifo_buffer_s|)) (_ BitVec 3) (|fifo_buffer#14| state))
; yosys-smt2-anyseq fifo_buffer#15 32 $auto$setundef.cc:533:execute$358
; yosys-smt2-witness {"offset": 0, "path": ["\\_witness_", "\\anyseq_auto_setundef_cc_533_execute_358"], "smtname": 15, "smtoffset": 0, "type": "seq", "width": 32}
(declare-fun |fifo_buffer#15| (|fifo_buffer_s|) (_ BitVec 32)) ; \_witness_.anyseq_auto_setundef_cc_533_execute_358
; yosys-smt2-wire _witness_.anyseq_auto_setundef_cc_533_execute_358 32
(define-fun |fifo_buffer_n _witness_.anyseq_auto_setundef_cc_533_execute_358| ((state |fifo_buffer_s|)) (_ BitVec 32) (|fifo_buffer#15| state))
; yosys-smt2-anyseq fifo_buffer#16 3 $auto$setundef.cc:533:execute$356
; yosys-smt2-witness {"offset": 0, "path": ["\\_witness_", "\\anyseq_auto_setundef_cc_533_execute_356"], "smtname": 16, "smtoffset": 0, "type": "seq", "width": 3}
(declare-fun |fifo_buffer#16| (|fifo_buffer_s|) (_ BitVec 3)) ; \_witness_.anyseq_auto_setundef_cc_533_execute_356
; yosys-smt2-wire _witness_.anyseq_auto_setundef_cc_533_execute_356 3
(define-fun |fifo_buffer_n _witness_.anyseq_auto_setundef_cc_533_execute_356| ((state |fifo_buffer_s|)) (_ BitVec 3) (|fifo_buffer#16| state))
; yosys-smt2-anyseq fifo_buffer#17 32 $auto$setundef.cc:533:execute$354
; yosys-smt2-witness {"offset": 0, "path": ["\\_witness_", "\\anyseq_auto_setundef_cc_533_execute_354"], "smtname": 17, "smtoffset": 0, "type": "seq", "width": 32}
(declare-fun |fifo_buffer#17| (|fifo_buffer_s|) (_ BitVec 32)) ; \_witness_.anyseq_auto_setundef_cc_533_execute_354
; yosys-smt2-wire _witness_.anyseq_auto_setundef_cc_533_execute_354 32
(define-fun |fifo_buffer_n _witness_.anyseq_auto_setundef_cc_533_execute_354| ((state |fifo_buffer_s|)) (_ BitVec 32) (|fifo_buffer#17| state))
; yosys-smt2-anyinit fifo_buffer#18 3 input_fifo.sv:56.5-66.8
; yosys-smt2-witness {"offset": 0, "path": ["\\_witness_", "\\anyinit_procdff_186"], "smtname": 18, "smtoffset": 0, "type": "init", "width": 3}
(declare-fun |fifo_buffer#18| (|fifo_buffer_s|) (_ BitVec 3)) ; \_witness_.anyinit_procdff_186
; yosys-smt2-register _witness_.anyinit_procdff_186 3
; yosys-smt2-wire _witness_.anyinit_procdff_186 3
(define-fun |fifo_buffer_n _witness_.anyinit_procdff_186| ((state |fifo_buffer_s|)) (_ BitVec 3) (|fifo_buffer#18| state))
; yosys-smt2-anyinit fifo_buffer#19 3 input_fifo.sv:56.5-66.8
; yosys-smt2-witness {"offset": 0, "path": ["\\_witness_", "\\anyinit_procdff_185"], "smtname": 19, "smtoffset": 0, "type": "init", "width": 3}
(declare-fun |fifo_buffer#19| (|fifo_buffer_s|) (_ BitVec 3)) ; \_witness_.anyinit_procdff_185
; yosys-smt2-register _witness_.anyinit_procdff_185 3
; yosys-smt2-wire _witness_.anyinit_procdff_185 3
(define-fun |fifo_buffer_n _witness_.anyinit_procdff_185| ((state |fifo_buffer_s|)) (_ BitVec 3) (|fifo_buffer#19| state))
; yosys-smt2-anyinit fifo_buffer#20 3 input_fifo.sv:56.5-66.8
; yosys-smt2-witness {"offset": 0, "path": ["\\_witness_", "\\anyinit_procdff_184"], "smtname": 20, "smtoffset": 0, "type": "init", "width": 3}
(declare-fun |fifo_buffer#20| (|fifo_buffer_s|) (_ BitVec 3)) ; \_witness_.anyinit_procdff_184
; yosys-smt2-register _witness_.anyinit_procdff_184 3
; yosys-smt2-wire _witness_.anyinit_procdff_184 3
(define-fun |fifo_buffer_n _witness_.anyinit_procdff_184| ((state |fifo_buffer_s|)) (_ BitVec 3) (|fifo_buffer#20| state))
; yosys-smt2-anyinit fifo_buffer#21 3 input_fifo.sv:56.5-66.8
; yosys-smt2-witness {"offset": 0, "path": ["\\_witness_", "\\anyinit_procdff_183"], "smtname": 21, "smtoffset": 0, "type": "init", "width": 3}
(declare-fun |fifo_buffer#21| (|fifo_buffer_s|) (_ BitVec 3)) ; \_witness_.anyinit_procdff_183
; yosys-smt2-register _witness_.anyinit_procdff_183 3
; yosys-smt2-wire _witness_.anyinit_procdff_183 3
(define-fun |fifo_buffer_n _witness_.anyinit_procdff_183| ((state |fifo_buffer_s|)) (_ BitVec 3) (|fifo_buffer#21| state))
; yosys-smt2-anyinit fifo_buffer#22 3 input_fifo.sv:56.5-66.8
; yosys-smt2-witness {"offset": 0, "path": ["\\_witness_", "\\anyinit_procdff_182"], "smtname": 22, "smtoffset": 0, "type": "init", "width": 3}
(declare-fun |fifo_buffer#22| (|fifo_buffer_s|) (_ BitVec 3)) ; \_witness_.anyinit_procdff_182
; yosys-smt2-register _witness_.anyinit_procdff_182 3
; yosys-smt2-wire _witness_.anyinit_procdff_182 3
(define-fun |fifo_buffer_n _witness_.anyinit_procdff_182| ((state |fifo_buffer_s|)) (_ BitVec 3) (|fifo_buffer#22| state))
; yosys-smt2-anyinit fifo_buffer#23 3 input_fifo.sv:56.5-66.8
; yosys-smt2-witness {"offset": 0, "path": ["\\_witness_", "\\anyinit_procdff_181"], "smtname": 23, "smtoffset": 0, "type": "init", "width": 3}
(declare-fun |fifo_buffer#23| (|fifo_buffer_s|) (_ BitVec 3)) ; \_witness_.anyinit_procdff_181
; yosys-smt2-register _witness_.anyinit_procdff_181 3
; yosys-smt2-wire _witness_.anyinit_procdff_181 3
(define-fun |fifo_buffer_n _witness_.anyinit_procdff_181| ((state |fifo_buffer_s|)) (_ BitVec 3) (|fifo_buffer#23| state))
; yosys-smt2-anyinit fifo_buffer#24 3 input_fifo.sv:56.5-66.8
; yosys-smt2-witness {"offset": 0, "path": ["\\_witness_", "\\anyinit_procdff_180"], "smtname": 24, "smtoffset": 0, "type": "init", "width": 3}
(declare-fun |fifo_buffer#24| (|fifo_buffer_s|) (_ BitVec 3)) ; \_witness_.anyinit_procdff_180
; yosys-smt2-register _witness_.anyinit_procdff_180 3
; yosys-smt2-wire _witness_.anyinit_procdff_180 3
(define-fun |fifo_buffer_n _witness_.anyinit_procdff_180| ((state |fifo_buffer_s|)) (_ BitVec 3) (|fifo_buffer#24| state))
; yosys-smt2-witness {"offset": 0, "path": ["$auto$async2sync.cc:110:execute$232"], "smtname": 25, "smtoffset": 0, "type": "reg", "width": 1}
(declare-fun |fifo_buffer#25| (|fifo_buffer_s|) (_ BitVec 1)) ; $auto$async2sync.cc:110:execute$232
; yosys-smt2-register $auto$async2sync.cc:110:execute$232 1
(define-fun |fifo_buffer_n $auto$async2sync.cc:110:execute$232| ((state |fifo_buffer_s|)) Bool (= ((_ extract 0 0) (|fifo_buffer#25| state)) #b1))
; yosys-smt2-witness {"offset": 0, "path": ["$auto$async2sync.cc:110:execute$226"], "smtname": 26, "smtoffset": 0, "type": "reg", "width": 1}
(declare-fun |fifo_buffer#26| (|fifo_buffer_s|) (_ BitVec 1)) ; $auto$async2sync.cc:110:execute$226
; yosys-smt2-register $auto$async2sync.cc:110:execute$226 1
(define-fun |fifo_buffer_n $auto$async2sync.cc:110:execute$226| ((state |fifo_buffer_s|)) Bool (= ((_ extract 0 0) (|fifo_buffer#26| state)) #b1))
; yosys-smt2-witness {"offset": 0, "path": ["$auto$async2sync.cc:110:execute$220"], "smtname": 27, "smtoffset": 0, "type": "reg", "width": 1}
(declare-fun |fifo_buffer#27| (|fifo_buffer_s|) (_ BitVec 1)) ; $auto$async2sync.cc:110:execute$220
; yosys-smt2-register $auto$async2sync.cc:110:execute$220 1
(define-fun |fifo_buffer_n $auto$async2sync.cc:110:execute$220| ((state |fifo_buffer_s|)) Bool (= ((_ extract 0 0) (|fifo_buffer#27| state)) #b1))
; yosys-smt2-witness {"offset": 0, "path": ["$auto$async2sync.cc:110:execute$214"], "smtname": 28, "smtoffset": 0, "type": "reg", "width": 1}
(declare-fun |fifo_buffer#28| (|fifo_buffer_s|) (_ BitVec 1)) ; $auto$async2sync.cc:110:execute$214
; yosys-smt2-register $auto$async2sync.cc:110:execute$214 1
(define-fun |fifo_buffer_n $auto$async2sync.cc:110:execute$214| ((state |fifo_buffer_s|)) Bool (= ((_ extract 0 0) (|fifo_buffer#28| state)) #b1))
; yosys-smt2-witness {"offset": 0, "path": ["$auto$async2sync.cc:110:execute$208"], "smtname": 29, "smtoffset": 0, "type": "reg", "width": 1}
(declare-fun |fifo_buffer#29| (|fifo_buffer_s|) (_ BitVec 1)) ; $auto$async2sync.cc:110:execute$208
; yosys-smt2-register $auto$async2sync.cc:110:execute$208 1
(define-fun |fifo_buffer_n $auto$async2sync.cc:110:execute$208| ((state |fifo_buffer_s|)) Bool (= ((_ extract 0 0) (|fifo_buffer#29| state)) #b1))
; yosys-smt2-witness {"offset": 0, "path": ["$auto$async2sync.cc:110:execute$202"], "smtname": 30, "smtoffset": 0, "type": "reg", "width": 1}
(declare-fun |fifo_buffer#30| (|fifo_buffer_s|) (_ BitVec 1)) ; $auto$async2sync.cc:110:execute$202
; yosys-smt2-register $auto$async2sync.cc:110:execute$202 1
(define-fun |fifo_buffer_n $auto$async2sync.cc:110:execute$202| ((state |fifo_buffer_s|)) Bool (= ((_ extract 0 0) (|fifo_buffer#30| state)) #b1))
; yosys-smt2-witness {"offset": 0, "path": ["$auto$async2sync.cc:101:execute$198"], "smtname": 31, "smtoffset": 0, "type": "reg", "width": 1}
(declare-fun |fifo_buffer#31| (|fifo_buffer_s|) (_ BitVec 1)) ; $auto$async2sync.cc:101:execute$198
; yosys-smt2-register $auto$async2sync.cc:101:execute$198 1
(define-fun |fifo_buffer_n $auto$async2sync.cc:101:execute$198| ((state |fifo_buffer_s|)) Bool (= ((_ extract 0 0) (|fifo_buffer#31| state)) #b1))
(define-fun |fifo_buffer#32| ((state |fifo_buffer_s|)) (_ BitVec 1) (bvnot (ite (|fifo_buffer#11| state) #b1 #b0))) ; $auto$rtlil.cc:2493:Not$367
; yosys-smt2-assume 0 $auto$formalff.cc:758:execute$368
(define-fun |fifo_buffer_u 0| ((state |fifo_buffer_s|)) Bool (or (= ((_ extract 0 0) (|fifo_buffer#32| state)) #b1) (not true))) ; $auto$formalff.cc:758:execute$368
; yosys-smt2-assert 0 write_addr_change
(define-fun |fifo_buffer_a 0| ((state |fifo_buffer_s|)) Bool (or (= ((_ extract 0 0) (|fifo_buffer#30| state)) #b1) (not (= ((_ extract 0 0) (|fifo_buffer#31| state)) #b1)))) ; write_addr_change
; yosys-smt2-assert 1 w_addr_bound
(define-fun |fifo_buffer_a 1| ((state |fifo_buffer_s|)) Bool (or (= ((_ extract 0 0) (|fifo_buffer#29| state)) #b1) (not (= ((_ extract 0 0) (|fifo_buffer#31| state)) #b1)))) ; w_addr_bound
; yosys-smt2-assert 2 read_addr_change
(define-fun |fifo_buffer_a 2| ((state |fifo_buffer_s|)) Bool (or (= ((_ extract 0 0) (|fifo_buffer#28| state)) #b1) (not (= ((_ extract 0 0) (|fifo_buffer#31| state)) #b1)))) ; read_addr_change
; yosys-smt2-assert 3 r_addr_bound
(define-fun |fifo_buffer_a 3| ((state |fifo_buffer_s|)) Bool (or (= ((_ extract 0 0) (|fifo_buffer#27| state)) #b1) (not (= ((_ extract 0 0) (|fifo_buffer#31| state)) #b1)))) ; r_addr_bound
; yosys-smt2-assert 4 count_change
(define-fun |fifo_buffer_a 4| ((state |fifo_buffer_s|)) Bool (or (= ((_ extract 0 0) (|fifo_buffer#26| state)) #b1) (not (= ((_ extract 0 0) (|fifo_buffer#31| state)) #b1)))) ; count_change
; yosys-smt2-assert 5 count_bound
(define-fun |fifo_buffer_a 5| ((state |fifo_buffer_s|)) Bool (or (= ((_ extract 0 0) (|fifo_buffer#25| state)) #b1) (not (= ((_ extract 0 0) (|fifo_buffer#31| state)) #b1)))) ; count_bound
(define-fun |fifo_buffer#33| ((state |fifo_buffer_s|)) Bool (not (or  (= ((_ extract 0 0) (|fifo_buffer#2| state)) #b1) (= ((_ extract 1 1) (|fifo_buffer#2| state)) #b1) (= ((_ extract 2 2) (|fifo_buffer#2| state)) #b1)))) ; $eq$input_fifo.sv:64$70_Y
(define-fun |fifo_buffer#34| ((state |fifo_buffer_s|)) Bool (= (|fifo_buffer#2| state) (|fifo_buffer#19| state))) ; $eq$input_fifo.sv:64$71_Y
(define-fun |fifo_buffer#35| ((state |fifo_buffer_s|)) Bool (or  (|fifo_buffer#33| state) false  (|fifo_buffer#34| state) false)) ; $logic_or$input_fifo.sv:64$72_Y
(define-fun |fifo_buffer#36| ((state |fifo_buffer_s|)) (_ BitVec 4) (bvadd (concat #b0 (|fifo_buffer#18| state)) #b0001)) ; $add$input_fifo.sv:64$73_Y
(define-fun |fifo_buffer#37| ((state |fifo_buffer_s|)) Bool (= (concat #b0 (|fifo_buffer#2| state)) (|fifo_buffer#36| state))) ; $eq$input_fifo.sv:64$74_Y
(define-fun |fifo_buffer#38| ((state |fifo_buffer_s|)) Bool (or  (|fifo_buffer#35| state) false  (|fifo_buffer#37| state) false)) ; $logic_or$input_fifo.sv:64$75_Y
(define-fun |fifo_buffer#39| ((state |fifo_buffer_s|)) Bool (bvuge (|fifo_buffer#2| state) #b000)) ; $ge$input_fifo.sv:60$52_Y
(define-fun |fifo_buffer#40| ((state |fifo_buffer_s|)) Bool (bvule (|fifo_buffer#2| state) #b111)) ; $le$input_fifo.sv:60$53_Y
(define-fun |fifo_buffer#41| ((state |fifo_buffer_s|)) Bool (and (or  (|fifo_buffer#39| state) false) (or  (|fifo_buffer#40| state) false))) ; $logic_and$input_fifo.sv:60$54_Y
(define-fun |fifo_buffer#42| ((state |fifo_buffer_s|)) Bool (not (or  (= ((_ extract 0 0) (|fifo_buffer#4| state)) #b1) (= ((_ extract 1 1) (|fifo_buffer#4| state)) #b1) (= ((_ extract 2 2) (|fifo_buffer#4| state)) #b1)))) ; $eq$input_fifo.sv:63$64_Y
(define-fun |fifo_buffer#43| ((state |fifo_buffer_s|)) Bool (= (|fifo_buffer#4| state) (|fifo_buffer#21| state))) ; $eq$input_fifo.sv:63$65_Y
(define-fun |fifo_buffer#44| ((state |fifo_buffer_s|)) Bool (or  (|fifo_buffer#42| state) false  (|fifo_buffer#43| state) false)) ; $logic_or$input_fifo.sv:63$66_Y
(define-fun |fifo_buffer#45| ((state |fifo_buffer_s|)) (_ BitVec 4) (bvadd (concat #b0 (|fifo_buffer#20| state)) #b0001)) ; $add$input_fifo.sv:63$67_Y
(define-fun |fifo_buffer#46| ((state |fifo_buffer_s|)) Bool (= (concat #b0 (|fifo_buffer#4| state)) (|fifo_buffer#45| state))) ; $eq$input_fifo.sv:63$68_Y
(define-fun |fifo_buffer#47| ((state |fifo_buffer_s|)) Bool (or  (|fifo_buffer#44| state) false  (|fifo_buffer#46| state) false)) ; $logic_or$input_fifo.sv:63$69_Y
(define-fun |fifo_buffer#48| ((state |fifo_buffer_s|)) Bool (bvuge (|fifo_buffer#4| state) #b000)) ; $ge$input_fifo.sv:59$49_Y
(define-fun |fifo_buffer#49| ((state |fifo_buffer_s|)) Bool (bvule (|fifo_buffer#4| state) #b111)) ; $le$input_fifo.sv:59$50_Y
(define-fun |fifo_buffer#50| ((state |fifo_buffer_s|)) Bool (and (or  (|fifo_buffer#48| state) false) (or  (|fifo_buffer#49| state) false))) ; $logic_and$input_fifo.sv:59$51_Y
(define-fun |fifo_buffer#51| ((state |fifo_buffer_s|)) Bool (not (or  (= ((_ extract 0 0) (|fifo_buffer#10| state)) #b1) (= ((_ extract 1 1) (|fifo_buffer#10| state)) #b1) (= ((_ extract 2 2) (|fifo_buffer#10| state)) #b1)))) ; $eq$input_fifo.sv:62$55_Y
(define-fun |fifo_buffer#52| ((state |fifo_buffer_s|)) Bool (= (|fifo_buffer#10| state) (|fifo_buffer#24| state))) ; $eq$input_fifo.sv:62$56_Y
(define-fun |fifo_buffer#53| ((state |fifo_buffer_s|)) Bool (or  (|fifo_buffer#51| state) false  (|fifo_buffer#52| state) false)) ; $logic_or$input_fifo.sv:62$57_Y
(define-fun |fifo_buffer#54| ((state |fifo_buffer_s|)) (_ BitVec 4) (bvadd (concat #b0 (|fifo_buffer#23| state)) #b0001)) ; $add$input_fifo.sv:62$58_Y [3:0]
(define-fun |fifo_buffer#55| ((state |fifo_buffer_s|)) Bool (= (concat #b0 (|fifo_buffer#10| state)) (|fifo_buffer#54| state))) ; $eq$input_fifo.sv:62$59_Y
(define-fun |fifo_buffer#56| ((state |fifo_buffer_s|)) Bool (or  (|fifo_buffer#53| state) false  (|fifo_buffer#55| state) false)) ; $logic_or$input_fifo.sv:62$60_Y
(define-fun |fifo_buffer#57| ((state |fifo_buffer_s|)) (_ BitVec 4) (bvsub (concat #b0 (|fifo_buffer#22| state)) #b0001)) ; { $sub$input_fifo.sv:62$61_Y [31] $sub$input_fifo.sv:62$61_Y [2:0] }
(define-fun |fifo_buffer#58| ((state |fifo_buffer_s|)) Bool (= (concat #b00000000000000000000000000000 (|fifo_buffer#10| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (concat ((_ extract 3 3) (|fifo_buffer#57| state)) (|fifo_buffer#57| state))))))))))))))))))))))))))))))) ; $eq$input_fifo.sv:62$62_Y
(define-fun |fifo_buffer#59| ((state |fifo_buffer_s|)) Bool (or  (|fifo_buffer#56| state) false  (|fifo_buffer#58| state) false)) ; $logic_or$input_fifo.sv:62$63_Y
(define-fun |fifo_buffer#60| ((state |fifo_buffer_s|)) Bool (bvule (concat #b0 (|fifo_buffer#10| state)) #b1000)) ; $le$input_fifo.sv:34$23_Y
(define-fun |fifo_buffer#61| ((state |fifo_buffer_s|)) Bool (bvuge (|fifo_buffer#10| state) #b000)) ; $ge$input_fifo.sv:58$47_Y
(define-fun |fifo_buffer#62| ((state |fifo_buffer_s|)) Bool (and (or  (|fifo_buffer#60| state) false) (or  (|fifo_buffer#61| state) false))) ; $logic_and$input_fifo.sv:58$48_Y
(define-fun |fifo_buffer#63| ((state |fifo_buffer_s|)) (_ BitVec 3) (bvsub (|fifo_buffer#10| state) #b001)) ; $sub$input_fifo.sv:41$34_Y [2:0]
(define-fun |fifo_buffer#64| ((state |fifo_buffer_s|)) Bool (not (or  (|fifo_buffer#3| state) false))) ; $logic_not$input_fifo.sv:39$30_Y
(define-fun |fifo_buffer#65| ((state |fifo_buffer_s|)) Bool (bvugt (|fifo_buffer#10| state) #b000)) ; $gt$input_fifo.sv:39$31_Y
(define-fun |fifo_buffer#66| ((state |fifo_buffer_s|)) Bool (and (or  (|fifo_buffer#64| state) false) (or  (|fifo_buffer#65| state) false))) ; $logic_and$input_fifo.sv:39$32_Y
(define-fun |fifo_buffer#67| ((state |fifo_buffer_s|)) (_ BitVec 3) (ite (|fifo_buffer#66| state) (|fifo_buffer#63| state) (|fifo_buffer#10| state))) ; $procmux$170_Y
(define-fun |fifo_buffer#68| ((state |fifo_buffer_s|)) (_ BitVec 3) (bvadd (|fifo_buffer#10| state) #b001)) ; $add$input_fifo.sv:37$29_Y [2:0]
(define-fun |fifo_buffer#69| ((state |fifo_buffer_s|)) Bool (and (or  (|fifo_buffer#3| state) false) (or  (|fifo_buffer#60| state) false))) ; $logic_and$input_fifo.sv:34$24_Y
(define-fun |fifo_buffer#70| ((state |fifo_buffer_s|)) (_ BitVec 3) (ite (|fifo_buffer#69| state) (|fifo_buffer#68| state) (|fifo_buffer#67| state))) ; $procmux$173_Y
(define-fun |fifo_buffer#71| ((state |fifo_buffer_s|)) (_ BitVec 3) (ite (= ((_ extract 0 0) (|fifo_buffer#7| state)) #b1) (|fifo_buffer#70| state) (|fifo_buffer#10| state))) ; $procmux$175_Y
(define-fun |fifo_buffer#72| ((state |fifo_buffer_s|)) (_ BitVec 3) (ite (= ((_ extract 0 0) (|fifo_buffer#0| state)) #b1) #b000 (|fifo_buffer#71| state))) ; $0\count[2:0]
(define-fun |fifo_buffer#73| ((state |fifo_buffer_s|)) (_ BitVec 3) (bvadd (|fifo_buffer#4| state) #b001)) ; $add$input_fifo.sv:40$33_Y
(define-fun |fifo_buffer#74| ((state |fifo_buffer_s|)) (_ BitVec 3) (ite (|fifo_buffer#66| state) (|fifo_buffer#73| state) (|fifo_buffer#4| state))) ; $procmux$146_Y
(define-fun |fifo_buffer#75| ((state |fifo_buffer_s|)) (_ BitVec 3) (ite (|fifo_buffer#69| state) (|fifo_buffer#4| state) (|fifo_buffer#74| state))) ; $procmux$149_Y
(define-fun |fifo_buffer#76| ((state |fifo_buffer_s|)) (_ BitVec 3) (ite (= ((_ extract 0 0) (|fifo_buffer#7| state)) #b1) (|fifo_buffer#75| state) (|fifo_buffer#4| state))) ; $procmux$151_Y
(define-fun |fifo_buffer#77| ((state |fifo_buffer_s|)) (_ BitVec 3) (ite (= ((_ extract 0 0) (|fifo_buffer#0| state)) #b1) #b000 (|fifo_buffer#76| state))) ; $0\read_addr[2:0]
(define-fun |fifo_buffer#78| ((state |fifo_buffer_s|)) (_ BitVec 3) (bvadd (|fifo_buffer#2| state) #b001)) ; $add$input_fifo.sv:36$28_Y
(define-fun |fifo_buffer#79| ((state |fifo_buffer_s|)) (_ BitVec 3) (ite (|fifo_buffer#69| state) (|fifo_buffer#78| state) (|fifo_buffer#2| state))) ; $procmux$160_Y
(define-fun |fifo_buffer#80| ((state |fifo_buffer_s|)) (_ BitVec 3) (ite (= ((_ extract 0 0) (|fifo_buffer#7| state)) #b1) (|fifo_buffer#79| state) (|fifo_buffer#2| state))) ; $procmux$162_Y
(define-fun |fifo_buffer#81| ((state |fifo_buffer_s|)) (_ BitVec 3) (ite (= ((_ extract 0 0) (|fifo_buffer#0| state)) #b1) #b000 (|fifo_buffer#80| state))) ; $0\write_addr[2:0]
(define-fun |fifo_buffer#82| ((state |fifo_buffer_s|)) (_ BitVec 3) (ite (|fifo_buffer#69| state) (|fifo_buffer#2| state) (|fifo_buffer#16| state))) ; $3$memwr$\FIFO$input_fifo.sv:35$8_ADDR[2:0]$25
(define-fun |fifo_buffer#83| ((state |fifo_buffer_s|)) (_ BitVec 3) (ite (= ((_ extract 0 0) (|fifo_buffer#7| state)) #b1) (|fifo_buffer#82| state) (|fifo_buffer#14| state))) ; $2$memwr$\FIFO$input_fifo.sv:35$8_ADDR[2:0]$20
(define-fun |fifo_buffer#84| ((state |fifo_buffer_s|)) (_ BitVec 3) (ite (= ((_ extract 0 0) (|fifo_buffer#0| state)) #b1) (|fifo_buffer#12| state) (|fifo_buffer#83| state))) ; $0$memwr$\FIFO$input_fifo.sv:35$8_ADDR[2:0]$14
(define-fun |fifo_buffer#85| ((state |fifo_buffer_s|)) (_ BitVec 32) (ite (|fifo_buffer#69| state) (|fifo_buffer#9| state) (|fifo_buffer#17| state))) ; $3$memwr$\FIFO$input_fifo.sv:35$8_DATA[31:0]$26
(define-fun |fifo_buffer#86| ((state |fifo_buffer_s|)) (_ BitVec 32) (ite (= ((_ extract 0 0) (|fifo_buffer#7| state)) #b1) (|fifo_buffer#85| state) (|fifo_buffer#15| state))) ; $2$memwr$\FIFO$input_fifo.sv:35$8_DATA[31:0]$21
(define-fun |fifo_buffer#87| ((state |fifo_buffer_s|)) (_ BitVec 32) (ite (= ((_ extract 0 0) (|fifo_buffer#0| state)) #b1) (|fifo_buffer#13| state) (|fifo_buffer#86| state))) ; $0$memwr$\FIFO$input_fifo.sv:35$8_DATA[31:0]$15
(define-fun |fifo_buffer#88| ((state |fifo_buffer_s|)) (_ BitVec 1) (ite (|fifo_buffer#69| state) #b1 #b0)) ; $3$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$27 [31]
(define-fun |fifo_buffer#89| ((state |fifo_buffer_s|)) (_ BitVec 1) (ite (= ((_ extract 0 0) (|fifo_buffer#7| state)) #b1) (|fifo_buffer#88| state) #b0)) ; $2$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$22 [31]
(define-fun |fifo_buffer#90| ((state |fifo_buffer_s|)) (_ BitVec 1) (ite (= ((_ extract 0 0) (|fifo_buffer#0| state)) #b1) #b0 (|fifo_buffer#89| state))) ; $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31]
(define-fun |fifo_buffer_m:W0A FIFO| ((state |fifo_buffer_s|)) (_ BitVec 3) (|fifo_buffer#84| state)) ; $0$memwr$\FIFO$input_fifo.sv:35$8_ADDR[2:0]$14
(define-fun |fifo_buffer_m:W0D FIFO| ((state |fifo_buffer_s|)) (_ BitVec 32) (|fifo_buffer#87| state)) ; $0$memwr$\FIFO$input_fifo.sv:35$8_DATA[31:0]$15
(define-fun |fifo_buffer_m:W0M FIFO| ((state |fifo_buffer_s|)) (_ BitVec 32) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (concat (|fifo_buffer#90| state) (|fifo_buffer#90| state))))))))))))))))))))))))))))))))) ; { $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] $0$memwr$\FIFO$input_fifo.sv:35$8_EN[31:0]$16 [31] }
(define-fun |fifo_buffer#5#1| ((state |fifo_buffer_s|)) (Array (_ BitVec 3) (_ BitVec 32)) (ite (= (|fifo_buffer_m:W0M FIFO| state) #b00000000000000000000000000000000) (|fifo_buffer#5#0| state) (store (|fifo_buffer#5#0| state) (|fifo_buffer_m:W0A FIFO| state) (bvor (bvand (|fifo_buffer_m:W0D FIFO| state) (|fifo_buffer_m:W0M FIFO| state)) (bvand (select (|fifo_buffer#5#0| state) (|fifo_buffer_m:W0A FIFO| state)) (bvnot (|fifo_buffer_m:W0M FIFO| state))))))) ; FIFO
(define-fun |fifo_buffer_a| ((state |fifo_buffer_s|)) Bool (and
  (|fifo_buffer_a 0| state)
  (|fifo_buffer_a 1| state)
  (|fifo_buffer_a 2| state)
  (|fifo_buffer_a 3| state)
  (|fifo_buffer_a 4| state)
  (|fifo_buffer_a 5| state)
))
(define-fun |fifo_buffer_u| ((state |fifo_buffer_s|)) Bool 
  (|fifo_buffer_u 0| state)
)
(define-fun |fifo_buffer_i| ((state |fifo_buffer_s|)) Bool (and
  (= (|fifo_buffer#2| state) #b000) ; write_addr
  (= (|fifo_buffer#4| state) #b000) ; read_addr
  (= (|fifo_buffer#10| state) #b000) ; count
  (= (= ((_ extract 0 0) (|fifo_buffer#25| state)) #b1) true) ; $auto$async2sync.cc:110:execute$232
  (= (= ((_ extract 0 0) (|fifo_buffer#26| state)) #b1) true) ; $auto$async2sync.cc:110:execute$226
  (= (= ((_ extract 0 0) (|fifo_buffer#27| state)) #b1) true) ; $auto$async2sync.cc:110:execute$220
  (= (= ((_ extract 0 0) (|fifo_buffer#28| state)) #b1) true) ; $auto$async2sync.cc:110:execute$214
  (= (= ((_ extract 0 0) (|fifo_buffer#29| state)) #b1) true) ; $auto$async2sync.cc:110:execute$208
  (= (= ((_ extract 0 0) (|fifo_buffer#30| state)) #b1) true) ; $auto$async2sync.cc:110:execute$202
  (= (= ((_ extract 0 0) (|fifo_buffer#31| state)) #b1) false) ; $auto$async2sync.cc:101:execute$198
))
(define-fun |fifo_buffer_h| ((state |fifo_buffer_s|)) Bool true)
(define-fun |fifo_buffer_t| ((state |fifo_buffer_s|) (next_state |fifo_buffer_s|)) Bool (and
  (= (|fifo_buffer#1| state) (|fifo_buffer#31| next_state)) ; $auto$async2sync.cc:104:execute$200 $auto$async2sync.cc:101:execute$198
  (= (ite (|fifo_buffer#38| state) #b1 #b0) (|fifo_buffer#30| next_state)) ; $auto$async2sync.cc:112:execute$203 $auto$async2sync.cc:110:execute$202
  (= (ite (|fifo_buffer#41| state) #b1 #b0) (|fifo_buffer#29| next_state)) ; $auto$async2sync.cc:112:execute$209 $auto$async2sync.cc:110:execute$208
  (= (ite (|fifo_buffer#47| state) #b1 #b0) (|fifo_buffer#28| next_state)) ; $auto$async2sync.cc:112:execute$215 $auto$async2sync.cc:110:execute$214
  (= (ite (|fifo_buffer#50| state) #b1 #b0) (|fifo_buffer#27| next_state)) ; $auto$async2sync.cc:112:execute$221 $auto$async2sync.cc:110:execute$220
  (= (ite (|fifo_buffer#59| state) #b1 #b0) (|fifo_buffer#26| next_state)) ; $auto$async2sync.cc:112:execute$227 $auto$async2sync.cc:110:execute$226
  (= (ite (|fifo_buffer#62| state) #b1 #b0) (|fifo_buffer#25| next_state)) ; $auto$async2sync.cc:112:execute$233 $auto$async2sync.cc:110:execute$232
  (= (|fifo_buffer#10| state) (|fifo_buffer#24| next_state)) ; $procdff$180 \_witness_.anyinit_procdff_180
  (= (|fifo_buffer#10| state) (|fifo_buffer#23| next_state)) ; $procdff$181 \_witness_.anyinit_procdff_181
  (= (|fifo_buffer#10| state) (|fifo_buffer#22| next_state)) ; $procdff$182 \_witness_.anyinit_procdff_182
  (= (|fifo_buffer#4| state) (|fifo_buffer#21| next_state)) ; $procdff$183 \_witness_.anyinit_procdff_183
  (= (|fifo_buffer#4| state) (|fifo_buffer#20| next_state)) ; $procdff$184 \_witness_.anyinit_procdff_184
  (= (|fifo_buffer#2| state) (|fifo_buffer#19| next_state)) ; $procdff$185 \_witness_.anyinit_procdff_185
  (= (|fifo_buffer#2| state) (|fifo_buffer#18| next_state)) ; $procdff$186 \_witness_.anyinit_procdff_186
  (= (|fifo_buffer#72| state) (|fifo_buffer#10| next_state)) ; $procdff$187 \count
  (= (|fifo_buffer#77| state) (|fifo_buffer#4| next_state)) ; $procdff$189 \read_addr
  (= (|fifo_buffer#81| state) (|fifo_buffer#2| next_state)) ; $procdff$188 \write_addr
  (= (|fifo_buffer#5#1| state) (|fifo_buffer#5#0| next_state)) ; FIFO
)) ; end of module fifo_buffer
; yosys-smt2-topmod fifo_buffer
; end of yosys output
