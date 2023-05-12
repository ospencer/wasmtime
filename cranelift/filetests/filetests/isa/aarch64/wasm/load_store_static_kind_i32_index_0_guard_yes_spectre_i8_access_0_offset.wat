;;! target = "aarch64"
;;!
;;! settings = ['enable_heap_access_spectre_mitigation=true']
;;!
;;! compile = true
;;!
;;! [globals.vmctx]
;;! type = "i64"
;;! vmctx = true
;;!
;;! [globals.heap_base]
;;! type = "i64"
;;! load = { base = "vmctx", offset = 0, readonly = true }
;;!
;;! # (no heap_bound global for static heaps)
;;!
;;! [[heaps]]
;;! base = "heap_base"
;;! min_size = 0x10000
;;! offset_guard_size = 0
;;! index_type = "i32"
;;! style = { kind = "static", bound = 0x10000000 }

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i32 1)

  (func (export "do_store") (param i32 i32)
    local.get 0
    local.get 1
    i32.store8 offset=0)

  (func (export "do_load") (param i32) (result i32)
    local.get 0
    i32.load8_u offset=0))

;; function u0:0:
;; block0:
;;   mov w9, w0
;;   ldr x10, [x2]
;;   add x10, x10, x0, UXTW
;;   movz x11, #0
;;   orr x8, xzr, #268435455
;;   subs xzr, x9, x8
;;   csel x11, x11, x10, hi
;;   csdb
;;   strb w1, [x11]
;;   b label1
;; block1:
;;   ret
;;
;; function u0:1:
;; block0:
;;   mov w9, w0
;;   ldr x10, [x1]
;;   add x10, x10, x0, UXTW
;;   movz x11, #0
;;   orr x8, xzr, #268435455
;;   subs xzr, x9, x8
;;   csel x11, x11, x10, hi
;;   csdb
;;   ldrb w0, [x11]
;;   b label1
;; block1:
;;   ret
