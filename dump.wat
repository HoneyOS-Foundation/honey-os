(module $bootloader.wasm
  (type (;0;) (func (param i32)))
  (type (;1;) (func (param i32 i32)))
  (type (;2;) (func (param i32 i32) (result i32)))
  (type (;3;) (func (param i32 i32 i32) (result i32)))
  (type (;4;) (func (result i32)))
  (type (;5;) (func))
  (type (;6;) (func (param i32 i32 i32)))
  (type (;7;) (func (param i32 i32 i32 i32)))
  (type (;8;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;9;) (func (param i32 i32 i32 i32 i32 i32)))
  (type (;10;) (func (param i32) (result i32)))
  (type (;11;) (func (param i64 i32)))
  (type (;12;) (func (param i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;13;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;14;) (func (param i64 i32 i32) (result i32)))
  (type (;15;) (func (param i32 i32 i32 i32 i32)))
  (type (;16;) (func (param i32 i64 i64 i64 i64)))
  (import "env" "memory" (memory (;0;) 17 16384 shared))
  (import "hapi" "stdout_write" (func $_ZN4hapi3ffi12stdout_write17h71e5f9014c1d9a4fE (type 1)))
  (import "hapi" "pid" (func $_ZN4hapi3ffi3pid17he3ddf86caef2352aE (type 4)))
  (import "hapi" "stdout_clear" (func $_ZN4hapi3ffi12stdout_clear17h40e2d6e05c9fd14fE (type 5)))
  (import "hapi" "stdout_clear_line" (func $_ZN4hapi3ffi17stdout_clear_line17hf10351ebe06015e4E (type 5)))
  (func $__wasm_init_tls (type 0) (param i32)
    local.get 0
    global.set $__tls_base
    local.get 0
    i32.const 0
    i32.const 24
    memory.init $.tdata)
  (func $__wasm_init_memory (type 5)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          i32.const 1054476
          i32.const 0
          i32.const 1
          i32.atomic.rmw.cmpxchg
          br_table 0 (;@3;) 1 (;@2;) 2 (;@1;)
        end
        i32.const 1048576
        i32.const 1048576
        global.set $__tls_base
        i32.const 0
        i32.const 24
        memory.init $.tdata
        i32.const 1048600
        i32.const 0
        i32.const 5352
        memory.init $.rodata
        i32.const 1053952
        i32.const 0
        i32.const 524
        memory.fill
        i32.const 1054476
        i32.const 2
        i32.atomic.store
        i32.const 1054476
        i32.const -1
        memory.atomic.notify
        drop
        br 1 (;@1;)
      end
      i32.const 1054476
      i32.const 1
      i64.const -1
      memory.atomic.wait32
      drop
    end
    data.drop $.rodata)
  (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hcdd6221b2f2b34a3E (type 2) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    local.get 1
    call $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h88408237604245e2E)
  (func $_ZN4core3fmt5Write9write_fmt17ha9ac37fb789f75c0E (type 2) (param i32 i32) (result i32)
    local.get 0
    i32.const 1048620
    local.get 1
    call $_ZN4core3fmt5write17h55b62ec8489b4effE)
  (func $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17hed41479ee867d133E (type 0) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end)
  (func $_ZN4hapi6stdout7writeln17hda9dfccb5411cdcaE (type 0) (param i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 8
    i32.add
    local.get 0
    call $_ZN60_$LT$alloc..string..String$u20$as$u20$core..clone..Clone$GT$5clone17h6b93b50df1762922E
    local.get 1
    i32.const 2
    i32.store offset=36
    local.get 1
    i32.const 1048604
    i32.store offset=32
    local.get 1
    i64.const 1
    i64.store offset=44 align=4
    local.get 1
    i32.const 1
    i32.store offset=60
    local.get 1
    local.get 1
    i32.const 56
    i32.add
    i32.store offset=40
    local.get 1
    local.get 1
    i32.const 8
    i32.add
    i32.store offset=56
    local.get 1
    i32.const 20
    i32.add
    local.get 1
    i32.const 32
    i32.add
    call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
    local.get 1
    i32.load offset=20
    local.set 0
    local.get 1
    i32.load offset=24
    local.tee 2
    local.get 1
    i32.load offset=28
    call $_ZN4hapi3ffi12stdout_write17h71e5f9014c1d9a4fE
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 0
      i32.const 1
      call $__rust_dealloc
    end
    block  ;; label = @1
      local.get 1
      i32.load offset=8
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=12
      local.get 0
      i32.const 1
      call $__rust_dealloc
    end
    local.get 1
    i32.const 64
    i32.add
    global.set $__stack_pointer)
  (func $_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17hfb89e3d6c2568f08E.llvm.12628461014352780869 (type 2) (param i32 i32) (result i32)
    local.get 0
    i32.load offset=4
    local.get 0
    i32.load offset=8
    local.get 1
    call $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h88408237604245e2E)
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17had9e027a1aa3b2ccE (type 2) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const 0
            i32.store offset=12
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            block  ;; label = @5
              local.get 1
              i32.const 65536
              i32.ge_u
              br_if 0 (;@5;)
              local.get 2
              local.get 1
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=14
              local.get 2
              local.get 1
              i32.const 12
              i32.shr_u
              i32.const 224
              i32.or
              i32.store8 offset=12
              local.get 2
              local.get 1
              i32.const 6
              i32.shr_u
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=13
              i32.const 3
              local.set 1
              br 3 (;@2;)
            end
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=15
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            local.get 2
            local.get 1
            i32.const 18
            i32.shr_u
            i32.const 7
            i32.and
            i32.const 240
            i32.or
            i32.store8 offset=12
            i32.const 4
            local.set 1
            br 2 (;@2;)
          end
          block  ;; label = @4
            local.get 0
            i32.load offset=8
            local.tee 3
            local.get 0
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 0
            local.get 3
            call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17hd674caba485a4a52E
            local.get 0
            i32.load offset=8
            local.set 3
          end
          local.get 0
          local.get 3
          i32.const 1
          i32.add
          i32.store offset=8
          local.get 0
          i32.load offset=4
          local.get 3
          i32.add
          local.get 1
          i32.store8
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=13
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 1
      end
      block  ;; label = @2
        local.get 0
        i32.load
        local.get 0
        i32.load offset=8
        local.tee 3
        i32.sub
        local.get 1
        i32.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.get 3
        local.get 1
        call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h9c43c6db2a98d9e5E.llvm.12628461014352780869
        local.get 0
        i32.load offset=8
        local.set 3
      end
      local.get 0
      i32.load offset=4
      local.get 3
      i32.add
      local.get 2
      i32.const 12
      i32.add
      local.get 1
      memory.copy
      local.get 0
      local.get 3
      local.get 1
      i32.add
      i32.store offset=8
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    i32.const 0)
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17hd674caba485a4a52E (type 1) (param i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load
      local.tee 3
      i32.const 1
      i32.shl
      local.tee 4
      local.get 1
      local.get 4
      local.get 1
      i32.gt_u
      select
      local.tee 1
      i32.const 8
      local.get 1
      i32.const 8
      i32.gt_u
      select
      local.tee 1
      i32.const -1
      i32.xor
      i32.const 31
      i32.shr_u
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          i32.const 0
          local.set 3
          br 1 (;@2;)
        end
        local.get 2
        local.get 3
        i32.store offset=28
        local.get 2
        local.get 0
        i32.load offset=4
        i32.store offset=20
        i32.const 1
        local.set 3
      end
      local.get 2
      local.get 3
      i32.store offset=24
      local.get 2
      i32.const 8
      i32.add
      local.get 4
      local.get 1
      local.get 2
      i32.const 20
      i32.add
      call $_ZN5alloc7raw_vec11finish_grow17h2e3cd82ff91598e4E.llvm.12628461014352780869
      block  ;; label = @2
        local.get 2
        i32.load offset=8
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.load offset=12
        local.tee 0
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 2
        i32.load offset=16
        call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
        unreachable
      end
      local.get 2
      i32.load offset=12
      local.set 3
      local.get 0
      local.get 1
      i32.store
      local.get 0
      local.get 3
      i32.store offset=4
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    call $_ZN5alloc7raw_vec17capacity_overflow17h45f3b19af45ec27bE
    unreachable)
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h9c43c6db2a98d9e5E.llvm.12628461014352780869 (type 6) (param i32 i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      local.get 2
      i32.add
      local.tee 2
      local.get 1
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 1
      local.set 4
      local.get 0
      i32.load
      local.tee 5
      i32.const 1
      i32.shl
      local.tee 1
      local.get 2
      local.get 1
      local.get 2
      i32.gt_u
      select
      local.tee 1
      i32.const 8
      local.get 1
      i32.const 8
      i32.gt_u
      select
      local.tee 1
      i32.const -1
      i32.xor
      i32.const 31
      i32.shr_u
      local.set 2
      block  ;; label = @2
        block  ;; label = @3
          local.get 5
          br_if 0 (;@3;)
          i32.const 0
          local.set 4
          br 1 (;@2;)
        end
        local.get 3
        local.get 5
        i32.store offset=28
        local.get 3
        local.get 0
        i32.load offset=4
        i32.store offset=20
      end
      local.get 3
      local.get 4
      i32.store offset=24
      local.get 3
      i32.const 8
      i32.add
      local.get 2
      local.get 1
      local.get 3
      i32.const 20
      i32.add
      call $_ZN5alloc7raw_vec11finish_grow17h2e3cd82ff91598e4E.llvm.12628461014352780869
      block  ;; label = @2
        local.get 3
        i32.load offset=8
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        i32.load offset=12
        local.tee 0
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 3
        i32.load offset=16
        call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
        unreachable
      end
      local.get 3
      i32.load offset=12
      local.set 2
      local.get 0
      local.get 1
      i32.store
      local.get 0
      local.get 2
      i32.store offset=4
      local.get 3
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    call $_ZN5alloc7raw_vec17capacity_overflow17h45f3b19af45ec27bE
    unreachable)
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h52d87c11c795cdddE (type 3) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.get 0
      i32.load offset=8
      local.tee 3
      i32.sub
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 2
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h9c43c6db2a98d9e5E.llvm.12628461014352780869
      local.get 0
      i32.load offset=8
      local.set 3
    end
    local.get 0
    i32.load offset=4
    local.get 3
    i32.add
    local.get 1
    local.get 2
    memory.copy
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0)
  (func $_ZN5alloc7raw_vec11finish_grow17h2e3cd82ff91598e4E.llvm.12628461014352780869 (type 7) (param i32 i32 i32 i32)
    (local i32 i32 i32)
    i32.const 1
    local.set 4
    i32.const 0
    local.set 5
    i32.const 4
    local.set 6
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.load offset=4
                i32.eqz
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 3
                  i32.load offset=8
                  local.tee 4
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 2
                    br_if 0 (;@8;)
                    i32.const 1
                    local.set 4
                    br 4 (;@4;)
                  end
                  i32.const 0
                  i32.load8_u offset=1053953
                  drop
                  local.get 2
                  i32.const 1
                  call $__rust_alloc
                  local.set 4
                  br 2 (;@5;)
                end
                local.get 3
                i32.load
                local.get 4
                i32.const 1
                local.get 2
                call $__rust_realloc
                local.set 4
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 2
                br_if 0 (;@6;)
                i32.const 1
                local.set 4
                br 2 (;@4;)
              end
              i32.const 0
              i32.load8_u offset=1053953
              drop
              local.get 2
              i32.const 1
              call $__rust_alloc
              local.set 4
            end
            local.get 4
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 0
          local.get 4
          i32.store offset=4
          i32.const 0
          local.set 4
          br 1 (;@2;)
        end
        i32.const 1
        local.set 4
        local.get 0
        i32.const 1
        i32.store offset=4
      end
      i32.const 8
      local.set 6
      local.get 2
      local.set 5
    end
    local.get 0
    local.get 6
    i32.add
    local.get 5
    i32.store
    local.get 0
    local.get 4
    i32.store)
  (func $_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17hbd22de30bea3fa42E (type 1) (param i32 i32)
    local.get 1
    local.get 1
    call $_ZN10bootloader6_start28_$u7b$$u7b$closure$u7d$$u7d$17h7bcceeaf4923263bE)
  (func $_ZN10bootloader6_start28_$u7b$$u7b$closure$u7d$$u7d$17h7bcceeaf4923263bE (type 1) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 0
    i32.store offset=40
    local.get 2
    i64.const 4294967296
    i64.store offset=32 align=4
    local.get 2
    i32.const 3
    i32.store8 offset=76
    local.get 2
    i32.const 32
    i32.store offset=60
    local.get 2
    i32.const 0
    i32.store offset=72
    local.get 2
    i32.const 1048644
    i32.store offset=68
    local.get 2
    i32.const 0
    i32.store offset=52
    local.get 2
    i32.const 0
    i32.store offset=44
    local.get 2
    local.get 2
    i32.const 32
    i32.add
    i32.store offset=64
    block  ;; label = @1
      local.get 1
      local.get 2
      i32.const 44
      i32.add
      call $_ZN73_$LT$core..panic..panic_info..PanicInfo$u20$as$u20$core..fmt..Display$GT$3fmt17hbb48b73a4a2a8746E
      br_if 0 (;@1;)
      local.get 2
      i32.const 8
      i32.add
      i32.const 8
      i32.add
      local.get 2
      i32.const 32
      i32.add
      i32.const 8
      i32.add
      i32.load
      i32.store
      local.get 2
      local.get 2
      i64.load offset=32 align=4
      i64.store offset=8
      local.get 2
      i32.const 6
      i32.store offset=28
      local.get 2
      local.get 2
      i32.const 8
      i32.add
      i32.store offset=24
      local.get 2
      i64.const 1
      i64.store offset=56 align=4
      local.get 2
      i32.const 1
      i32.store offset=48
      local.get 2
      i32.const 1048960
      i32.store offset=44
      local.get 2
      local.get 2
      i32.const 24
      i32.add
      i32.store offset=52
      local.get 2
      i32.const 32
      i32.add
      local.get 2
      i32.const 44
      i32.add
      call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
      local.get 2
      i32.const 32
      i32.add
      call $_ZN4hapi6stdout7writeln17hda9dfccb5411cdcaE
      block  ;; label = @2
        local.get 2
        i32.load offset=32
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.load offset=36
        local.get 1
        i32.const 1
        call $__rust_dealloc
      end
      block  ;; label = @2
        local.get 2
        i32.load offset=8
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.load offset=12
        local.get 1
        i32.const 1
        call $__rust_dealloc
      end
      local.get 2
      i32.const 80
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 1048668
    i32.const 55
    local.get 2
    i32.const 8
    i32.add
    i32.const 1048724
    i32.const 1048864
    call $_ZN4core6result13unwrap_failed17ha1a4a677361ebda3E
    unreachable)
  (func $_ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17ha872a7de228e8298E (type 0) (param i32))
  (func $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17hed41479ee867d133E.1 (type 0) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end)
  (func $_ZN53_$LT$core..fmt..Error$u20$as$u20$core..fmt..Debug$GT$3fmt17haf1074f0f9151d42E (type 2) (param i32 i32) (result i32)
    local.get 1
    i32.const 1048880
    i32.const 5
    call $_ZN4core3fmt9Formatter9write_str17h1fe892ce632ffc37E)
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17had9e027a1aa3b2ccE.1 (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const 0
            i32.store offset=12
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            block  ;; label = @5
              local.get 1
              i32.const 65536
              i32.ge_u
              br_if 0 (;@5;)
              local.get 2
              local.get 1
              i32.const 12
              i32.shr_u
              i32.const 224
              i32.or
              i32.store8 offset=12
              local.get 2
              local.get 1
              i32.const 6
              i32.shr_u
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=13
              i32.const 3
              local.set 3
              i32.const 2
              local.set 4
              br 3 (;@2;)
            end
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            local.get 2
            local.get 1
            i32.const 18
            i32.shr_u
            i32.const 7
            i32.and
            i32.const 240
            i32.or
            i32.store8 offset=12
            i32.const 4
            local.set 3
            i32.const 3
            local.set 4
            br 2 (;@2;)
          end
          block  ;; label = @4
            local.get 0
            i32.load offset=8
            local.tee 3
            local.get 0
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 0
            local.get 3
            call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17hd674caba485a4a52E
            local.get 0
            i32.load offset=8
            local.set 3
          end
          local.get 0
          i32.load offset=4
          local.get 3
          i32.add
          local.get 1
          i32.store8
          local.get 0
          local.get 0
          i32.load offset=8
          i32.const 1
          i32.add
          i32.store offset=8
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 3
        i32.const 1
        local.set 4
      end
      local.get 2
      i32.const 12
      i32.add
      local.get 4
      i32.or
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8
      block  ;; label = @2
        local.get 0
        i32.load
        local.get 0
        i32.load offset=8
        local.tee 1
        i32.sub
        local.get 3
        i32.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        local.get 3
        call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h9c43c6db2a98d9e5E.llvm.12628461014352780869
        local.get 0
        i32.load offset=8
        local.set 1
      end
      local.get 0
      i32.load offset=4
      local.get 1
      i32.add
      local.get 2
      i32.const 12
      i32.add
      local.get 3
      memory.copy
      local.get 0
      local.get 1
      local.get 3
      i32.add
      i32.store offset=8
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    i32.const 0)
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h52d87c11c795cdddE.1 (type 3) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.get 0
      i32.load offset=8
      local.tee 3
      i32.sub
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 2
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h9c43c6db2a98d9e5E.llvm.12628461014352780869
      local.get 0
      i32.load offset=8
      local.set 3
    end
    local.get 0
    i32.load offset=4
    local.get 3
    i32.add
    local.get 1
    local.get 2
    memory.copy
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0)
  (func $_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17hfb89e3d6c2568f08E (type 2) (param i32 i32) (result i32)
    local.get 0
    i32.load offset=4
    local.get 0
    i32.load offset=8
    local.get 1
    call $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h88408237604245e2E)
  (func $_start (type 5)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 96
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    i32.const 1
    i32.const 1048888
    call $_ZN3std9panicking8set_hook17h6212d5852e6eeda7E
    local.get 0
    i32.const 1
    i32.store offset=76
    local.get 0
    i32.const 1048916
    i32.store offset=72
    local.get 0
    i64.const 0
    i64.store offset=84 align=4
    local.get 0
    i32.const 1048880
    i32.store offset=80
    local.get 0
    i32.const 72
    i32.add
    call $_ZN3std2io5stdio6_print17h12d72242e7805467E
    i32.const 0
    i32.load8_u offset=1053953
    drop
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          i32.const 20
          i32.const 1
          call $__rust_alloc
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.const 16
          i32.add
          i32.const 0
          i32.load offset=1048940 align=1
          i32.store align=1
          local.get 1
          i32.const 8
          i32.add
          i32.const 0
          i64.load offset=1048932 align=1
          i64.store align=1
          local.get 1
          i32.const 0
          i64.load offset=1048924 align=1
          i64.store align=1
          local.get 0
          i32.const 20
          i32.store offset=80
          local.get 0
          local.get 1
          i32.store offset=76
          local.get 0
          i32.const 20
          i32.store offset=72
          local.get 0
          i32.const 72
          i32.add
          call $_ZN4hapi6stdout7writeln17hda9dfccb5411cdcaE
          block  ;; label = @4
            local.get 0
            i32.load offset=72
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.load offset=76
            local.get 1
            i32.const 1
            call $__rust_dealloc
          end
          i32.const 0
          local.set 1
          loop  ;; label = @4
            i32.const 0
            i32.load8_u offset=1053953
            drop
            i32.const 24
            i32.const 1
            call $__rust_alloc
            local.tee 2
            i32.eqz
            br_if 2 (;@2;)
            local.get 2
            i32.const 16
            i32.add
            i32.const 0
            i64.load offset=1049480 align=1
            i64.store align=1
            local.get 2
            i32.const 8
            i32.add
            i32.const 0
            i64.load offset=1049472 align=1
            i64.store align=1
            local.get 2
            i32.const 0
            i64.load offset=1049464 align=1
            i64.store align=1
            local.get 0
            i32.const 24
            i32.store offset=56
            local.get 0
            local.get 2
            i32.store offset=52
            local.get 0
            i32.const 24
            i32.store offset=48
            local.get 0
            i32.const 1049509
            i32.store offset=64
            local.get 0
            i32.const 1
            i32.store offset=68
            local.get 0
            i32.const 2
            i32.store offset=76
            local.get 0
            i32.const 1049512
            i32.store offset=72
            local.get 0
            i64.const 2
            i64.store offset=84 align=4
            local.get 0
            i32.const 7
            i32.store offset=32
            local.get 0
            i32.const 6
            i32.store offset=24
            local.get 0
            local.get 0
            i32.const 20
            i32.add
            i32.store offset=80
            local.get 0
            local.get 0
            i32.const 64
            i32.add
            i32.store offset=28
            local.get 0
            local.get 0
            i32.const 48
            i32.add
            i32.store offset=20
            local.get 0
            i32.const 8
            i32.add
            local.get 0
            i32.const 72
            i32.add
            call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
            block  ;; label = @5
              local.get 0
              i32.load offset=48
              local.tee 2
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=52
              local.get 2
              i32.const 1
              call $__rust_dealloc
            end
            local.get 0
            i32.const 48
            i32.add
            i32.const 8
            i32.add
            local.tee 2
            local.get 0
            i32.const 8
            i32.add
            i32.const 8
            i32.add
            local.tee 3
            i32.load
            i32.store
            local.get 0
            local.get 0
            i64.load offset=8 align=4
            i64.store offset=48
            local.get 0
            i32.const 1
            i32.store offset=68
            local.get 0
            i32.const 1049509
            i32.const 1049508
            local.get 1
            select
            i32.store offset=64
            local.get 0
            i32.const 2
            i32.store offset=76
            local.get 0
            i32.const 1049512
            i32.store offset=72
            local.get 0
            i64.const 2
            i64.store offset=84 align=4
            local.get 0
            i32.const 7
            i32.store offset=32
            local.get 0
            i32.const 6
            i32.store offset=24
            local.get 0
            local.get 0
            i32.const 20
            i32.add
            i32.store offset=80
            local.get 0
            local.get 0
            i32.const 64
            i32.add
            i32.store offset=28
            local.get 0
            local.get 0
            i32.const 48
            i32.add
            i32.store offset=20
            local.get 0
            i32.const 8
            i32.add
            local.get 0
            i32.const 72
            i32.add
            call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
            block  ;; label = @5
              local.get 0
              i32.load offset=48
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=52
              local.get 4
              i32.const 1
              call $__rust_dealloc
            end
            local.get 2
            local.get 3
            i32.load
            i32.store
            local.get 0
            local.get 0
            i64.load offset=8 align=4
            i64.store offset=48
            local.get 0
            i32.const 1
            i32.store offset=68
            local.get 0
            i32.const 1049508
            i32.const 1049509
            local.get 1
            i32.const 2
            i32.lt_u
            select
            i32.store offset=64
            local.get 0
            i32.const 2
            i32.store offset=76
            local.get 0
            i32.const 1049512
            i32.store offset=72
            local.get 0
            i64.const 2
            i64.store offset=84 align=4
            local.get 0
            i32.const 7
            i32.store offset=32
            local.get 0
            i32.const 6
            i32.store offset=24
            local.get 0
            local.get 0
            i32.const 20
            i32.add
            i32.store offset=80
            local.get 0
            local.get 0
            i32.const 64
            i32.add
            i32.store offset=28
            local.get 0
            local.get 0
            i32.const 48
            i32.add
            i32.store offset=20
            local.get 0
            i32.const 8
            i32.add
            local.get 0
            i32.const 72
            i32.add
            call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
            block  ;; label = @5
              local.get 0
              i32.load offset=48
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=52
              local.get 4
              i32.const 1
              call $__rust_dealloc
            end
            local.get 2
            local.get 3
            i32.load
            i32.store
            local.get 0
            local.get 0
            i64.load offset=8 align=4
            i64.store offset=48
            local.get 0
            i32.const 1
            i32.store offset=68
            local.get 0
            i32.const 1049508
            i32.const 1049509
            local.get 1
            i32.const 3
            i32.lt_u
            select
            i32.store offset=64
            local.get 0
            i32.const 2
            i32.store offset=76
            local.get 0
            i32.const 1049512
            i32.store offset=72
            local.get 0
            i64.const 2
            i64.store offset=84 align=4
            local.get 0
            i32.const 7
            i32.store offset=32
            local.get 0
            i32.const 6
            i32.store offset=24
            local.get 0
            local.get 0
            i32.const 20
            i32.add
            i32.store offset=80
            local.get 0
            local.get 0
            i32.const 64
            i32.add
            i32.store offset=28
            local.get 0
            local.get 0
            i32.const 48
            i32.add
            i32.store offset=20
            local.get 0
            i32.const 8
            i32.add
            local.get 0
            i32.const 72
            i32.add
            call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
            block  ;; label = @5
              local.get 0
              i32.load offset=48
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=52
              local.get 4
              i32.const 1
              call $__rust_dealloc
            end
            local.get 2
            local.get 3
            i32.load
            i32.store
            local.get 0
            local.get 0
            i64.load offset=8 align=4
            i64.store offset=48
            local.get 0
            i32.const 1
            i32.store offset=68
            local.get 0
            i32.const 1049508
            i32.const 1049509
            local.get 1
            i32.const 4
            i32.lt_u
            select
            i32.store offset=64
            local.get 0
            i32.const 2
            i32.store offset=76
            local.get 0
            i32.const 1049512
            i32.store offset=72
            local.get 0
            i64.const 2
            i64.store offset=84 align=4
            local.get 0
            i32.const 7
            i32.store offset=32
            local.get 0
            i32.const 6
            i32.store offset=24
            local.get 0
            local.get 0
            i32.const 20
            i32.add
            i32.store offset=80
            local.get 0
            local.get 0
            i32.const 64
            i32.add
            i32.store offset=28
            local.get 0
            local.get 0
            i32.const 48
            i32.add
            i32.store offset=20
            local.get 0
            i32.const 8
            i32.add
            local.get 0
            i32.const 72
            i32.add
            call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
            block  ;; label = @5
              local.get 0
              i32.load offset=48
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=52
              local.get 4
              i32.const 1
              call $__rust_dealloc
            end
            local.get 2
            local.get 3
            i32.load
            i32.store
            local.get 0
            local.get 0
            i64.load offset=8 align=4
            i64.store offset=48
            local.get 0
            i32.const 1
            i32.store offset=68
            local.get 0
            i32.const 1049508
            i32.const 1049509
            local.get 1
            i32.const 5
            i32.lt_u
            select
            i32.store offset=64
            local.get 0
            i32.const 2
            i32.store offset=76
            local.get 0
            i32.const 1049512
            i32.store offset=72
            local.get 0
            i64.const 2
            i64.store offset=84 align=4
            local.get 0
            i32.const 7
            i32.store offset=32
            local.get 0
            i32.const 6
            i32.store offset=24
            local.get 0
            local.get 0
            i32.const 20
            i32.add
            i32.store offset=80
            local.get 0
            local.get 0
            i32.const 64
            i32.add
            i32.store offset=28
            local.get 0
            local.get 0
            i32.const 48
            i32.add
            i32.store offset=20
            local.get 0
            i32.const 8
            i32.add
            local.get 0
            i32.const 72
            i32.add
            call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
            block  ;; label = @5
              local.get 0
              i32.load offset=48
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=52
              local.get 4
              i32.const 1
              call $__rust_dealloc
            end
            local.get 2
            local.get 3
            i32.load
            i32.store
            local.get 0
            local.get 0
            i64.load offset=8 align=4
            i64.store offset=48
            local.get 0
            i32.const 1
            i32.store offset=68
            local.get 0
            i32.const 1049508
            i32.const 1049509
            local.get 1
            i32.const 6
            i32.lt_u
            select
            i32.store offset=64
            local.get 0
            i32.const 2
            i32.store offset=76
            local.get 0
            i32.const 1049512
            i32.store offset=72
            local.get 0
            i64.const 2
            i64.store offset=84 align=4
            local.get 0
            i32.const 7
            i32.store offset=32
            local.get 0
            i32.const 6
            i32.store offset=24
            local.get 0
            local.get 0
            i32.const 20
            i32.add
            i32.store offset=80
            local.get 0
            local.get 0
            i32.const 64
            i32.add
            i32.store offset=28
            local.get 0
            local.get 0
            i32.const 48
            i32.add
            i32.store offset=20
            local.get 0
            i32.const 8
            i32.add
            local.get 0
            i32.const 72
            i32.add
            call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
            block  ;; label = @5
              local.get 0
              i32.load offset=48
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=52
              local.get 4
              i32.const 1
              call $__rust_dealloc
            end
            local.get 2
            local.get 3
            i32.load
            i32.store
            local.get 0
            local.get 0
            i64.load offset=8 align=4
            i64.store offset=48
            local.get 0
            i32.const 1
            i32.store offset=68
            local.get 0
            i32.const 1049508
            i32.const 1049509
            local.get 1
            i32.const 7
            i32.lt_u
            select
            i32.store offset=64
            local.get 0
            i32.const 2
            i32.store offset=76
            local.get 0
            i32.const 1049512
            i32.store offset=72
            local.get 0
            i64.const 2
            i64.store offset=84 align=4
            local.get 0
            i32.const 7
            i32.store offset=32
            local.get 0
            i32.const 6
            i32.store offset=24
            local.get 0
            local.get 0
            i32.const 20
            i32.add
            i32.store offset=80
            local.get 0
            local.get 0
            i32.const 64
            i32.add
            i32.store offset=28
            local.get 0
            local.get 0
            i32.const 48
            i32.add
            i32.store offset=20
            local.get 0
            i32.const 8
            i32.add
            local.get 0
            i32.const 72
            i32.add
            call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
            block  ;; label = @5
              local.get 0
              i32.load offset=48
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=52
              local.get 4
              i32.const 1
              call $__rust_dealloc
            end
            local.get 2
            local.get 3
            i32.load
            i32.store
            local.get 0
            local.get 0
            i64.load offset=8 align=4
            i64.store offset=48
            local.get 0
            i32.const 1
            i32.store offset=68
            local.get 0
            i32.const 1049508
            i32.const 1049509
            local.get 1
            i32.const 8
            i32.lt_u
            select
            i32.store offset=64
            local.get 0
            i32.const 2
            i32.store offset=76
            local.get 0
            i32.const 1049512
            i32.store offset=72
            local.get 0
            i64.const 2
            i64.store offset=84 align=4
            local.get 0
            i32.const 7
            i32.store offset=32
            local.get 0
            i32.const 6
            i32.store offset=24
            local.get 0
            local.get 0
            i32.const 20
            i32.add
            i32.store offset=80
            local.get 0
            local.get 0
            i32.const 64
            i32.add
            i32.store offset=28
            local.get 0
            local.get 0
            i32.const 48
            i32.add
            i32.store offset=20
            local.get 0
            i32.const 8
            i32.add
            local.get 0
            i32.const 72
            i32.add
            call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
            block  ;; label = @5
              local.get 0
              i32.load offset=48
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=52
              local.get 4
              i32.const 1
              call $__rust_dealloc
            end
            local.get 2
            local.get 3
            i32.load
            i32.store
            local.get 0
            local.get 0
            i64.load offset=8 align=4
            i64.store offset=48
            local.get 0
            i32.const 1
            i32.store offset=68
            local.get 0
            i32.const 1049508
            i32.const 1049509
            local.get 1
            i32.const 9
            i32.lt_u
            select
            i32.store offset=64
            local.get 0
            i32.const 2
            i32.store offset=76
            local.get 0
            i32.const 1049512
            i32.store offset=72
            local.get 0
            i64.const 2
            i64.store offset=84 align=4
            local.get 0
            i32.const 7
            i32.store offset=32
            local.get 0
            i32.const 6
            i32.store offset=24
            local.get 0
            local.get 0
            i32.const 20
            i32.add
            i32.store offset=80
            local.get 0
            local.get 0
            i32.const 64
            i32.add
            i32.store offset=28
            local.get 0
            local.get 0
            i32.const 48
            i32.add
            i32.store offset=20
            local.get 0
            i32.const 8
            i32.add
            local.get 0
            i32.const 72
            i32.add
            call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
            block  ;; label = @5
              local.get 0
              i32.load offset=48
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=52
              local.get 4
              i32.const 1
              call $__rust_dealloc
            end
            local.get 2
            local.get 3
            i32.load
            i32.store
            local.get 0
            local.get 0
            i64.load offset=8 align=4
            i64.store offset=48
            local.get 0
            i32.const 2
            i32.store offset=76
            local.get 0
            i32.const 1049492
            i32.store offset=72
            local.get 0
            i64.const 1
            i64.store offset=84 align=4
            local.get 0
            i32.const 6
            i32.store offset=24
            local.get 0
            local.get 0
            i32.const 20
            i32.add
            i32.store offset=80
            local.get 0
            local.get 0
            i32.const 48
            i32.add
            i32.store offset=20
            local.get 0
            i32.const 36
            i32.add
            local.get 0
            i32.const 72
            i32.add
            call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
            block  ;; label = @5
              local.get 0
              i32.load offset=48
              local.tee 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=52
              local.get 3
              i32.const 1
              call $__rust_dealloc
            end
            local.get 2
            local.get 0
            i32.const 36
            i32.add
            i32.const 8
            i32.add
            i32.load
            i32.store
            local.get 0
            local.get 0
            i64.load offset=36 align=4
            i64.store offset=48
            local.get 0
            i32.const 6
            i32.store offset=68
            local.get 0
            local.get 0
            i32.const 48
            i32.add
            i32.store offset=64
            local.get 0
            i64.const 1
            i64.store offset=84 align=4
            local.get 0
            i32.const 1
            i32.store offset=76
            local.get 0
            i32.const 1048960
            i32.store offset=72
            local.get 0
            local.get 0
            i32.const 64
            i32.add
            i32.store offset=80
            local.get 0
            i32.const 20
            i32.add
            local.get 0
            i32.const 72
            i32.add
            call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
            local.get 0
            i32.const 20
            i32.add
            call $_ZN4hapi6stdout7writeln17hda9dfccb5411cdcaE
            block  ;; label = @5
              local.get 0
              i32.load offset=20
              local.tee 2
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=24
              local.get 2
              i32.const 1
              call $__rust_dealloc
            end
            i64.const 0
            i32.const 500000000
            call $_ZN3std6thread5sleep17he7bace389a782edbE
            call $_ZN4hapi6stdout10clear_line17h5f8170283428f215E
            block  ;; label = @5
              local.get 0
              i32.load offset=48
              local.tee 2
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=52
              local.get 2
              i32.const 1
              call $__rust_dealloc
            end
            local.get 1
            i32.const 1
            i32.add
            local.tee 1
            i32.const 10
            i32.ne
            br_if 0 (;@4;)
          end
          i32.const 0
          i32.load8_u offset=1053953
          drop
          i32.const 15
          i32.const 1
          call $__rust_alloc
          local.tee 1
          i32.eqz
          br_if 2 (;@1;)
          local.get 1
          i32.const 7
          i32.add
          i32.const 0
          i64.load offset=1048951 align=1
          i64.store align=1
          local.get 1
          i32.const 0
          i64.load offset=1048944 align=1
          i64.store align=1
          local.get 0
          i32.const 15
          i32.store offset=80
          local.get 0
          local.get 1
          i32.store offset=76
          local.get 0
          i32.const 15
          i32.store offset=72
          local.get 0
          i32.const 72
          i32.add
          call $_ZN4hapi6stdout7writeln17hda9dfccb5411cdcaE
          local.get 1
          i32.const 15
          i32.const 1
          call $__rust_dealloc
          call $_ZN4hapi6stdout5clear17h9a156d15f20c9155E
          local.get 0
          i32.const 7
          i32.store offset=52
          local.get 0
          i32.const 1049408
          i32.store offset=48
          local.get 0
          i64.const 1
          i64.store offset=84 align=4
          local.get 0
          i32.const 1
          i32.store offset=76
          local.get 0
          i32.const 1048960
          i32.store offset=72
          local.get 0
          local.get 0
          i32.const 48
          i32.add
          i32.store offset=80
          local.get 0
          i32.const 20
          i32.add
          local.get 0
          i32.const 72
          i32.add
          call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
          local.get 0
          i32.const 20
          i32.add
          call $_ZN4hapi6stdout7writeln17hda9dfccb5411cdcaE
          block  ;; label = @4
            local.get 0
            i32.load offset=20
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.load offset=24
            local.get 1
            i32.const 1
            call $__rust_dealloc
          end
          call $_ZN4hapi3ffi3pid17he3ddf86caef2352aE
          local.set 1
          local.get 0
          i32.const 8
          i32.store offset=52
          local.get 0
          local.get 1
          i32.store offset=64
          local.get 0
          local.get 0
          i32.const 64
          i32.add
          i32.store offset=48
          local.get 0
          i64.const 1
          i64.store offset=84 align=4
          local.get 0
          i32.const 1
          i32.store offset=76
          local.get 0
          i32.const 1049432
          i32.store offset=72
          local.get 0
          local.get 0
          i32.const 48
          i32.add
          i32.store offset=80
          local.get 0
          i32.const 20
          i32.add
          local.get 0
          i32.const 72
          i32.add
          call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
          local.get 0
          i32.const 20
          i32.add
          call $_ZN4hapi6stdout7writeln17hda9dfccb5411cdcaE
          block  ;; label = @4
            local.get 0
            i32.load offset=20
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.load offset=24
            local.get 1
            i32.const 1
            call $__rust_dealloc
          end
          local.get 0
          i32.const 20
          i32.add
          call $_ZN4hapi7process3pid17hf9b3007209ca1b6aE
          local.get 0
          i32.const 6
          i32.store offset=68
          local.get 0
          local.get 0
          i32.const 20
          i32.add
          i32.store offset=64
          local.get 0
          i64.const 1
          i64.store offset=84 align=4
          local.get 0
          i32.const 1
          i32.store offset=76
          local.get 0
          i32.const 1049456
          i32.store offset=72
          local.get 0
          local.get 0
          i32.const 64
          i32.add
          i32.store offset=80
          local.get 0
          i32.const 48
          i32.add
          local.get 0
          i32.const 72
          i32.add
          call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
          local.get 0
          i32.const 48
          i32.add
          call $_ZN4hapi6stdout7writeln17hda9dfccb5411cdcaE
          block  ;; label = @4
            local.get 0
            i32.load offset=48
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.load offset=52
            local.get 1
            i32.const 1
            call $__rust_dealloc
          end
          block  ;; label = @4
            local.get 0
            i32.load offset=20
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.load offset=24
            local.get 1
            i32.const 1
            call $__rust_dealloc
          end
          local.get 0
          i32.const 96
          i32.add
          global.set $__stack_pointer
          return
        end
        i32.const 1
        i32.const 20
        call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
        unreachable
      end
      i32.const 1
      i32.const 24
      call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
      unreachable
    end
    i32.const 1
    i32.const 15
    call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
    unreachable)
  (func $__rust_alloc (type 2) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    local.get 1
    call $__rdl_alloc
    local.set 2
    local.get 2
    return)
  (func $__rust_dealloc (type 6) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call $__rdl_dealloc
    return)
  (func $__rust_realloc (type 8) (param i32 i32 i32 i32) (result i32)
    (local i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $__rdl_realloc
    local.set 4
    local.get 4
    return)
  (func $__rust_alloc_error_handler (type 1) (param i32 i32)
    local.get 0
    local.get 1
    call $__rg_oom
    return)
  (func $_ZN4hapi7process3pid17hf9b3007209ca1b6aE (type 0) (param i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 4
    i32.add
    call $_ZN4hapi3ffi3pid17he3ddf86caef2352aE
    i32.const 36
    call $_ZN5alloc6string6String15from_utf8_lossy17h847cec55033f5fe5E
    local.get 1
    i32.load offset=8
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load offset=12
            local.tee 3
            br_if 0 (;@4;)
            i32.const 1
            local.set 4
            br 1 (;@3;)
          end
          local.get 3
          i32.const 0
          i32.lt_s
          br_if 1 (;@2;)
          i32.const 0
          i32.load8_u offset=1053953
          drop
          local.get 3
          i32.const 1
          call $__rust_alloc
          local.tee 4
          i32.eqz
          br_if 2 (;@1;)
        end
        local.get 4
        local.get 2
        local.get 3
        memory.copy
        local.get 0
        local.get 3
        i32.store offset=8
        local.get 0
        local.get 4
        i32.store offset=4
        local.get 0
        local.get 3
        i32.store
        block  ;; label = @3
          local.get 1
          i32.load offset=4
          local.tee 3
          i32.const -2147483648
          i32.or
          i32.const -2147483648
          i32.eq
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          i32.const 1
          call $__rust_dealloc
        end
        local.get 1
        i32.const 16
        i32.add
        global.set $__stack_pointer
        return
      end
      call $_ZN5alloc7raw_vec17capacity_overflow17h45f3b19af45ec27bE
      unreachable
    end
    i32.const 1
    local.get 3
    call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
    unreachable)
  (func $_ZN4hapi6stdout5clear17h9a156d15f20c9155E (type 5)
    call $_ZN4hapi3ffi12stdout_clear17h40e2d6e05c9fd14fE)
  (func $_ZN4hapi6stdout10clear_line17h5f8170283428f215E (type 5)
    call $_ZN4hapi3ffi17stdout_clear_line17hf10351ebe06015e4E)
  (func $_ZN4core3ptr28drop_in_place$LT$$RF$str$GT$17h800211bd58f2cc07E (type 0) (param i32))
  (func $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h3bceb8e6c5131c36E (type 0) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end)
  (func $_ZN4core3ptr88drop_in_place$LT$core..panic..panic_info..PanicInfo..internal_constructor..NoPayload$GT$17h2ef38da117d3f36eE.llvm.13317409777152324161 (type 0) (param i32))
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17had9e027a1aa3b2ccE.2 (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const 0
            i32.store offset=12
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            block  ;; label = @5
              local.get 1
              i32.const 65536
              i32.ge_u
              br_if 0 (;@5;)
              local.get 2
              local.get 1
              i32.const 12
              i32.shr_u
              i32.const 224
              i32.or
              i32.store8 offset=12
              local.get 2
              local.get 1
              i32.const 6
              i32.shr_u
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=13
              i32.const 3
              local.set 3
              i32.const 2
              local.set 4
              br 3 (;@2;)
            end
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            local.get 2
            local.get 1
            i32.const 18
            i32.shr_u
            i32.const 7
            i32.and
            i32.const 240
            i32.or
            i32.store8 offset=12
            i32.const 4
            local.set 3
            i32.const 3
            local.set 4
            br 2 (;@2;)
          end
          block  ;; label = @4
            local.get 0
            i32.load offset=8
            local.tee 3
            local.get 0
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 0
            local.get 3
            call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17h322ca40853dbe2e1E
            local.get 0
            i32.load offset=8
            local.set 3
          end
          local.get 0
          i32.load offset=4
          local.get 3
          i32.add
          local.get 1
          i32.store8
          local.get 0
          local.get 0
          i32.load offset=8
          i32.const 1
          i32.add
          i32.store offset=8
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 3
        i32.const 1
        local.set 4
      end
      local.get 2
      i32.const 12
      i32.add
      local.get 4
      i32.or
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8
      block  ;; label = @2
        local.get 0
        i32.load
        local.get 0
        i32.load offset=8
        local.tee 1
        i32.sub
        local.get 3
        i32.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        local.get 3
        call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17ha8d8870fa1fd559bE
        local.get 0
        i32.load offset=8
        local.set 1
      end
      local.get 0
      i32.load offset=4
      local.get 1
      i32.add
      local.get 2
      i32.const 12
      i32.add
      local.get 3
      memory.copy
      local.get 0
      local.get 1
      local.get 3
      i32.add
      i32.store offset=8
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    i32.const 0)
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h52d87c11c795cdddE.2 (type 3) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.get 0
      i32.load offset=8
      local.tee 3
      i32.sub
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 2
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17ha8d8870fa1fd559bE
      local.get 0
      i32.load offset=8
      local.set 3
    end
    local.get 0
    i32.load offset=4
    local.get 3
    i32.add
    local.get 1
    local.get 2
    memory.copy
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0)
  (func $_ZN3std9panicking8set_hook17h6212d5852e6eeda7E (type 1) (param i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        i32.atomic.load offset=1054472
        i32.const 2147483647
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        call $_ZN3std9panicking11panic_count17is_zero_slow_path17h69ec01d9f0b5341bE
        i32.eqz
        br_if 1 (;@1;)
      end
      block  ;; label = @2
        i32.const 0
        i32.const 0
        i32.const 1073741823
        i32.atomic.rmw.cmpxchg offset=1053956
        i32.eqz
        br_if 0 (;@2;)
        i32.const 1053956
        call $_ZN3std3sys4sync6rwlock5futex6RwLock15write_contended17h49ac51d1758efb0dE
      end
      i32.const 0
      i32.load offset=1053968
      local.set 3
      i32.const 0
      local.get 1
      i32.store offset=1053968
      i32.const 0
      i32.load offset=1053964
      local.set 1
      i32.const 0
      local.get 0
      i32.store offset=1053964
      block  ;; label = @2
        i32.const 0
        i32.const 1073741823
        i32.atomic.rmw.sub offset=1053956
        i32.const -1073741823
        i32.add
        local.tee 0
        i32.const 1073741824
        i32.lt_u
        br_if 0 (;@2;)
        i32.const 1053956
        local.get 0
        call $_ZN3std3sys4sync6rwlock5futex6RwLock22wake_writer_or_readers17hb4a20ca5745bab1cE
      end
      block  ;; label = @2
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 3
        i32.load
        call_indirect (type 0)
        local.get 3
        i32.load offset=4
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 0
        local.get 3
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    local.get 2
    i32.const 1
    i32.store offset=12
    local.get 2
    i32.const 1049604
    i32.store offset=8
    local.get 2
    i64.const 0
    i64.store offset=20 align=4
    local.get 2
    i32.const 1049528
    i32.store offset=16
    local.get 2
    i32.const 8
    i32.add
    i32.const 1049736
    call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
    unreachable)
  (func $rust_begin_unwind (type 0) (param i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      local.tee 2
      br_if 0 (;@1;)
      i32.const 1049752
      call $_ZN4core6option13unwrap_failed17h7da440408d6f3f41E
      unreachable
    end
    local.get 1
    local.get 0
    i32.load offset=12
    i32.store offset=12
    local.get 1
    local.get 0
    i32.store offset=8
    local.get 1
    local.get 2
    i32.store offset=4
    local.get 1
    i32.const 4
    i32.add
    call $_ZN3std10sys_common9backtrace26__rust_end_short_backtrace17hefc9a3e6e4a3ff8aE
    unreachable)
  (func $_ZN102_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17heffe0194a79480cdE (type 1) (param i32 i32)
    (local i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      i32.load
      i32.const -2147483648
      i32.ne
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=12
      local.set 3
      local.get 2
      i32.const 36
      i32.add
      i32.const 8
      i32.add
      local.tee 4
      i32.const 0
      i32.store
      local.get 2
      i64.const 4294967296
      i64.store offset=36 align=4
      local.get 2
      i32.const 36
      i32.add
      i32.const 1049528
      local.get 3
      call $_ZN4core3fmt5write17h55b62ec8489b4effE
      drop
      local.get 2
      i32.const 24
      i32.add
      i32.const 8
      i32.add
      local.get 4
      i32.load
      local.tee 3
      i32.store
      local.get 2
      local.get 2
      i64.load offset=36 align=4
      local.tee 5
      i64.store offset=24
      local.get 1
      i32.const 8
      i32.add
      local.get 3
      i32.store
      local.get 1
      local.get 5
      i64.store align=4
    end
    local.get 1
    i64.load align=4
    local.set 5
    local.get 1
    i64.const 4294967296
    i64.store align=4
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.tee 3
    local.get 1
    i32.const 8
    i32.add
    local.tee 1
    i32.load
    i32.store
    local.get 1
    i32.const 0
    i32.store
    i32.const 0
    i32.load8_u offset=1053953
    drop
    local.get 2
    local.get 5
    i64.store offset=8
    block  ;; label = @1
      i32.const 12
      i32.const 4
      call $__rust_alloc
      local.tee 1
      br_if 0 (;@1;)
      i32.const 4
      i32.const 12
      call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
      unreachable
    end
    local.get 1
    local.get 2
    i64.load offset=8
    i64.store align=4
    local.get 1
    i32.const 8
    i32.add
    local.get 3
    i32.load
    i32.store
    local.get 0
    i32.const 1049768
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $_ZN102_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17h978c60e35d9b2e5fE (type 1) (param i32 i32)
    (local i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      i32.load
      i32.const -2147483648
      i32.ne
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=12
      local.set 3
      local.get 2
      i32.const 20
      i32.add
      i32.const 8
      i32.add
      local.tee 4
      i32.const 0
      i32.store
      local.get 2
      i64.const 4294967296
      i64.store offset=20 align=4
      local.get 2
      i32.const 20
      i32.add
      i32.const 1049528
      local.get 3
      call $_ZN4core3fmt5write17h55b62ec8489b4effE
      drop
      local.get 2
      i32.const 8
      i32.add
      i32.const 8
      i32.add
      local.get 4
      i32.load
      local.tee 3
      i32.store
      local.get 2
      local.get 2
      i64.load offset=20 align=4
      local.tee 5
      i64.store offset=8
      local.get 1
      i32.const 8
      i32.add
      local.get 3
      i32.store
      local.get 1
      local.get 5
      i64.store align=4
    end
    local.get 0
    i32.const 1049768
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17h232c2c2ffc092594E (type 1) (param i32 i32)
    (local i32 i32)
    i32.const 0
    i32.load8_u offset=1053953
    drop
    local.get 1
    i32.load offset=4
    local.set 2
    local.get 1
    i32.load
    local.set 3
    block  ;; label = @1
      i32.const 8
      i32.const 4
      call $__rust_alloc
      local.tee 1
      br_if 0 (;@1;)
      i32.const 4
      i32.const 8
      call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
      unreachable
    end
    local.get 1
    local.get 2
    i32.store offset=4
    local.get 1
    local.get 3
    i32.store
    local.get 0
    i32.const 1049784
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store)
  (func $_ZN3std9panicking20rust_panic_with_hook17h5d938c6f2f6345baE (type 9) (param i32 i32 i32 i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 6
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        i32.const 1
        i32.atomic.rmw.add offset=1054472
        i32.const 0
        i32.lt_s
        br_if 0 (;@2;)
        i32.const 0
        call $_ZN3std9panicking11panic_count17LOCAL_PANIC_COUNT7__getit17h1f4f26428983601aE.llvm.9857674224645661670
        local.tee 7
        i32.load8_u offset=4
        br_if 0 (;@2;)
        local.get 7
        i32.const 1
        i32.store8 offset=4
        local.get 7
        local.get 7
        i32.load
        i32.const 1
        i32.add
        i32.store
        local.get 6
        local.get 5
        i32.store8 offset=29
        local.get 6
        local.get 4
        i32.store8 offset=28
        local.get 6
        local.get 3
        i32.store offset=24
        local.get 6
        local.get 2
        i32.store offset=20
        local.get 6
        i32.const 1049800
        i32.store offset=16
        local.get 6
        i32.const 1049528
        i32.store offset=12
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.atomic.load offset=1053956
            local.tee 5
            i32.const 1073741821
            i32.gt_u
            br_if 0 (;@4;)
            i32.const 0
            local.get 5
            local.get 5
            i32.const 1
            i32.add
            i32.atomic.rmw.cmpxchg offset=1053956
            local.get 5
            i32.eq
            br_if 1 (;@3;)
          end
          i32.const 1053956
          call $_ZN3std3sys4sync6rwlock5futex6RwLock14read_contended17h31d44f8fba942917E
        end
        block  ;; label = @3
          i32.const 0
          i32.load offset=1053964
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          local.get 0
          local.get 1
          i32.load offset=16
          call_indirect (type 1)
          local.get 6
          local.get 6
          i64.load
          i64.store offset=12 align=4
          i32.const 0
          i32.load offset=1053964
          local.get 6
          i32.const 12
          i32.add
          i32.const 0
          i32.load offset=1053968
          i32.load offset=20
          call_indirect (type 1)
        end
        block  ;; label = @3
          i32.const 0
          i32.const 1
          i32.atomic.rmw.sub offset=1053956
          i32.const -1
          i32.add
          local.tee 6
          i32.const -1073741825
          i32.and
          i32.const -2147483648
          i32.ne
          br_if 0 (;@3;)
          i32.const 1053956
          local.get 6
          call $_ZN3std3sys4sync6rwlock5futex6RwLock22wake_writer_or_readers17hb4a20ca5745bab1cE
        end
        local.get 7
        i32.const 0
        i32.store8 offset=4
        local.get 4
        br_if 1 (;@1;)
      end
      unreachable
      unreachable
    end
    local.get 0
    local.get 1
    call $rust_panic
    unreachable)
  (func $rust_panic (type 1) (param i32 i32)
    local.get 0
    local.get 1
    call $__rust_start_panic
    drop
    unreachable
    unreachable)
  (func $_ZN3std2io8buffered9bufwriter18BufWriter$LT$W$GT$14write_all_cold17h71929ef15adfecaaE (type 7) (param i32 i32 i32 i32)
    (local i32 i32)
    local.get 1
    i32.load
    local.set 4
    block  ;; label = @1
      local.get 1
      i32.load offset=8
      local.tee 5
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      local.get 5
      i32.sub
      local.get 3
      i32.ge_u
      br_if 0 (;@1;)
      i32.const 0
      local.set 5
      local.get 1
      i32.const 0
      i32.store offset=8
      local.get 1
      i32.const 0
      i32.store8 offset=12
    end
    block  ;; label = @1
      local.get 4
      local.get 3
      i32.le_u
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=4
      local.get 5
      i32.add
      local.get 2
      local.get 3
      memory.copy
      local.get 0
      i32.const 4
      i32.store8
      local.get 1
      local.get 5
      local.get 3
      i32.add
      i32.store offset=8
      return
    end
    local.get 0
    i64.const 4
    i64.store align=4
    local.get 1
    i32.const 0
    i32.store8 offset=12)
  (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h90d667b75783d2e8E (type 2) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    local.get 1
    call $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h88408237604245e2E)
  (func $_ZN3std5alloc24default_alloc_error_hook17hb10cd7b0607bc6b3E (type 1) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      i32.const 0
      i32.load8_u offset=1053952
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const 2
      i32.store offset=16
      local.get 2
      i32.const 1049852
      i32.store offset=12
      local.get 2
      i64.const 1
      i64.store offset=24 align=4
      local.get 2
      i32.const 8
      i32.store offset=40
      local.get 2
      local.get 1
      i32.store offset=44
      local.get 2
      local.get 2
      i32.const 36
      i32.add
      i32.store offset=20
      local.get 2
      local.get 2
      i32.const 44
      i32.add
      i32.store offset=36
      local.get 2
      i32.const 12
      i32.add
      i32.const 1049988
      call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
      unreachable
    end
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $_ZN3std3sys12thread_local10fast_local12Key$LT$T$GT$14try_initialize17h47dc8302366a5cadE.llvm.11972105620972837968 (type 2) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    i32.const 0
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load8_u offset=8
          br_table 0 (;@3;) 1 (;@2;) 2 (;@1;) 0 (;@3;)
        end
        local.get 0
        i32.const 1
        i32.store8 offset=8
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          br_if 0 (;@3;)
          i32.const 0
          local.set 3
          br 1 (;@2;)
        end
        local.get 1
        i32.load
        local.set 3
        local.get 1
        i32.const 0
        i32.store
        local.get 1
        i32.load offset=4
        i32.const 0
        local.get 3
        select
        local.set 3
      end
      local.get 0
      i32.load offset=4
      local.set 1
      local.get 0
      local.get 3
      i32.store offset=4
      local.get 0
      i32.load
      local.set 3
      local.get 0
      i32.const 1
      i32.store
      local.get 2
      local.get 1
      i32.store offset=12
      local.get 2
      local.get 3
      i32.store offset=8
      block  ;; label = @2
        local.get 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.const 1
        i32.atomic.rmw.sub
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        atomic.fence
        local.get 2
        i32.const 8
        i32.add
        i32.const 4
        i32.add
        call $_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h272dc83cd57b5547E
      end
      local.get 0
      i32.const 4
      i32.add
      local.set 3
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 3)
  (func $__rg_oom (type 1) (param i32 i32)
    (local i32)
    local.get 1
    local.get 0
    i32.const 0
    i32.atomic.load offset=1053972
    local.tee 2
    i32.const 25
    local.get 2
    select
    call_indirect (type 1)
    unreachable
    unreachable)
  (func $_ZN3std3sys4sync5mutex5futex5Mutex14lock_contended17h21fa872088556641E (type 0) (param i32)
    (local i32 i32 i32)
    i32.const -100
    local.set 1
    block  ;; label = @1
      loop  ;; label = @2
        local.get 1
        local.set 2
        local.get 0
        i32.atomic.load
        local.tee 3
        i32.const 1
        i32.ne
        br_if 1 (;@1;)
        local.get 2
        i32.const 1
        i32.add
        local.set 1
        local.get 2
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        local.get 0
        i32.const 0
        i32.const 1
        i32.atomic.rmw.cmpxchg
        local.tee 3
        i32.eqz
        br_if 1 (;@1;)
      end
      loop  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 2
          i32.eq
          br_if 0 (;@3;)
          local.get 0
          i32.const 2
          i32.atomic.rmw.xchg
          i32.eqz
          br_if 2 (;@1;)
        end
        local.get 0
        i32.const 2
        i64.const -1
        memory.atomic.wait32
        drop
        i32.const -100
        local.set 2
        loop  ;; label = @3
          local.get 2
          local.tee 1
          i32.const 1
          i32.add
          local.set 2
          local.get 0
          i32.atomic.load
          local.tee 3
          i32.const 1
          i32.ne
          br_if 1 (;@2;)
          local.get 1
          i32.eqz
          br_if 1 (;@2;)
          br 0 (;@3;)
        end
      end
    end)
  (func $_ZN3std4sync9once_lock17OnceLock$LT$T$GT$10initialize17h904fea820818bbc3E (type 0) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 0
      i32.atomic.load offset=32
      i32.const 4
      i32.eq
      br_if 0 (;@1;)
      local.get 1
      local.get 0
      i32.store
      local.get 1
      local.get 1
      i32.const 15
      i32.add
      i32.store offset=4
      local.get 1
      local.get 1
      i32.store offset=8
      local.get 0
      i32.const 32
      i32.add
      local.get 1
      i32.const 8
      i32.add
      call $_ZN3std3sys4sync4once5futex4Once4call17h7fb705dc51f79757E.llvm.8846984551579673576
    end
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN3std3sys4sync4once5futex4Once4call17h7fb705dc51f79757E.llvm.8846984551579673576 (type 1) (param i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.atomic.load
        local.set 3
        block  ;; label = @3
          block  ;; label = @4
            loop  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 3
                        br_table 1 (;@9;) 1 (;@9;) 3 (;@7;) 6 (;@4;) 2 (;@8;) 0 (;@10;)
                      end
                      local.get 2
                      i32.const 1
                      i32.store offset=8
                      local.get 2
                      i32.const 1050428
                      i32.store offset=4
                      local.get 2
                      i64.const 0
                      i64.store offset=16 align=4
                      local.get 2
                      local.get 2
                      i32.const 28
                      i32.add
                      i32.store offset=12
                      local.get 2
                      i32.const 4
                      i32.add
                      i32.const 1050128
                      call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
                      unreachable
                    end
                    local.get 0
                    local.get 3
                    i32.const 2
                    i32.atomic.rmw.cmpxchg
                    local.tee 4
                    local.get 3
                    i32.ne
                    br_if 2 (;@6;)
                    local.get 1
                    i32.load
                    local.tee 4
                    i32.load
                    local.set 3
                    local.get 4
                    i32.const 0
                    i32.store
                    local.get 3
                    i32.eqz
                    br_if 5 (;@3;)
                    i32.const 0
                    i32.load8_u offset=1053953
                    drop
                    i32.const 1024
                    i32.const 1
                    call $__rust_alloc
                    local.tee 4
                    i32.eqz
                    br_if 7 (;@1;)
                    local.get 3
                    i64.const 0
                    i64.store align=4
                    local.get 3
                    i32.const 0
                    i32.store8 offset=28
                    local.get 3
                    i32.const 0
                    i32.store offset=24
                    local.get 3
                    local.get 4
                    i32.store offset=20
                    local.get 3
                    i32.const 1024
                    i32.store offset=16
                    local.get 3
                    i32.const 8
                    i32.add
                    i64.const 0
                    i64.store align=4
                    local.get 0
                    i32.const 4
                    i32.atomic.rmw.xchg
                    i32.const 3
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 0
                    i32.const 2147483647
                    memory.atomic.notify
                    drop
                  end
                  local.get 2
                  i32.const 32
                  i32.add
                  global.set $__stack_pointer
                  return
                end
                local.get 0
                i32.const 2
                i32.const 3
                i32.atomic.rmw.cmpxchg
                local.tee 4
                i32.const 2
                i32.eq
                br_if 2 (;@4;)
              end
              local.get 4
              local.set 3
              br 0 (;@5;)
            end
          end
          local.get 0
          i32.const 3
          i64.const -1
          memory.atomic.wait32
          drop
          br 1 (;@2;)
        end
      end
      i32.const 1050144
      call $_ZN4core6option13unwrap_failed17h7da440408d6f3f41E
      unreachable
    end
    i32.const 1
    i32.const 1024
    call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
    unreachable)
  (func $_ZN3std3sys4sync6rwlock5futex6RwLock14read_contended17h31d44f8fba942917E (type 0) (param i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    i32.const -100
    local.set 2
    block  ;; label = @1
      loop  ;; label = @2
        local.get 2
        local.set 3
        local.get 0
        i32.atomic.load
        local.tee 4
        i32.const 1073741823
        i32.ne
        br_if 1 (;@1;)
        local.get 3
        i32.const 1
        i32.add
        local.set 2
        local.get 3
        br_if 0 (;@2;)
      end
    end
    loop  ;; label = @1
      local.get 4
      i32.const 1073741823
      i32.and
      local.set 3
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 4
                i32.const 1073741823
                i32.gt_u
                br_if 0 (;@6;)
                local.get 3
                i32.const 1073741822
                i32.lt_u
                br_if 1 (;@5;)
              end
              local.get 3
              i32.const 1073741822
              i32.eq
              br_if 1 (;@4;)
              local.get 4
              i32.const 1073741824
              i32.and
              i32.eqz
              br_if 2 (;@3;)
              local.get 4
              local.set 3
              br 3 (;@2;)
            end
            local.get 0
            local.get 4
            local.get 4
            i32.const 1
            i32.add
            i32.atomic.rmw.cmpxchg
            local.tee 3
            local.get 4
            i32.ne
            local.set 2
            local.get 3
            local.set 4
            local.get 2
            br_if 3 (;@1;)
            local.get 1
            i32.const 32
            i32.add
            global.set $__stack_pointer
            return
          end
          local.get 1
          i32.const 1
          i32.store offset=12
          local.get 1
          i32.const 1050472
          i32.store offset=8
          local.get 1
          i64.const 0
          i64.store offset=20 align=4
          local.get 1
          i32.const 1050004
          i32.store offset=16
          local.get 1
          i32.const 8
          i32.add
          i32.const 1050616
          call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
          unreachable
        end
        local.get 0
        local.get 4
        local.get 4
        i32.const 1073741824
        i32.or
        local.tee 3
        i32.atomic.rmw.cmpxchg
        local.tee 2
        local.get 4
        i32.ne
        local.set 5
        local.get 2
        local.set 4
        local.get 5
        br_if 1 (;@1;)
      end
      local.get 0
      local.get 3
      i64.const -1
      memory.atomic.wait32
      drop
      i32.const -100
      local.set 3
      loop  ;; label = @2
        local.get 3
        local.tee 2
        i32.const 1
        i32.add
        local.set 3
        local.get 0
        i32.atomic.load
        local.tee 4
        i32.const 1073741823
        i32.ne
        br_if 1 (;@1;)
        local.get 2
        i32.eqz
        br_if 1 (;@1;)
        br 0 (;@2;)
      end
    end)
  (func $_ZN3std3sys4sync6rwlock5futex6RwLock15write_contended17h49ac51d1758efb0dE (type 0) (param i32)
    (local i32 i32 i32 i32 i32 i32)
    i32.const -100
    local.set 1
    block  ;; label = @1
      loop  ;; label = @2
        local.get 1
        local.set 2
        local.get 0
        i32.atomic.load
        local.tee 3
        i32.const 0
        i32.lt_s
        br_if 1 (;@1;)
        local.get 3
        i32.const 1073741823
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 2
        i32.const 1
        i32.add
        local.set 1
        local.get 2
        br_if 0 (;@2;)
      end
    end
    local.get 0
    i32.const 4
    i32.add
    local.set 4
    i32.const 1073741823
    local.set 5
    loop  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 1073741823
          i32.and
          br_if 0 (;@3;)
          local.get 0
          local.get 3
          local.get 3
          local.get 5
          i32.or
          i32.atomic.rmw.cmpxchg
          local.tee 2
          local.get 3
          i32.ne
          br_if 1 (;@2;)
          return
        end
        block  ;; label = @3
          local.get 3
          i32.const -1
          i32.le_s
          br_if 0 (;@3;)
          local.get 0
          local.get 3
          local.get 3
          i32.const -2147483648
          i32.or
          i32.atomic.rmw.cmpxchg
          local.tee 2
          local.get 3
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 0
        i32.atomic.load offset=4
        local.set 2
        i32.const -1073741825
        local.set 5
        local.get 0
        i32.atomic.load
        local.tee 3
        i32.const -1
        i32.gt_s
        br_if 1 (;@1;)
        local.get 3
        i32.const 1073741823
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        local.get 2
        i64.const -1
        memory.atomic.wait32
        drop
        i32.const -100
        local.set 2
        loop  ;; label = @3
          local.get 2
          local.tee 6
          i32.const 1
          i32.add
          local.set 2
          local.get 0
          i32.atomic.load
          local.tee 3
          i32.const 1073741823
          i32.and
          local.set 1
          local.get 3
          i32.const 0
          i32.lt_s
          br_if 2 (;@1;)
          local.get 1
          i32.eqz
          br_if 2 (;@1;)
          local.get 6
          i32.eqz
          br_if 2 (;@1;)
          br 0 (;@3;)
        end
      end
      local.get 2
      local.set 3
      br 0 (;@1;)
    end)
  (func $_ZN3std3sys4sync6rwlock5futex6RwLock22wake_writer_or_readers17hb4a20ca5745bab1cE (type 1) (param i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 1073741823
        i32.and
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 1
                i32.const -2147483648
                i32.ne
                br_if 0 (;@6;)
                local.get 0
                i32.const -2147483648
                i32.const 0
                i32.atomic.rmw.cmpxchg
                local.tee 1
                i32.const -2147483648
                i32.eq
                br_if 1 (;@5;)
              end
              local.get 1
              i32.const -1073741824
              i32.eq
              br_if 1 (;@4;)
              local.get 1
              i32.const 1073741824
              i32.ne
              br_if 4 (;@1;)
              br 2 (;@3;)
            end
            local.get 0
            i32.const 1
            i32.atomic.rmw.add offset=4
            drop
            local.get 0
            i32.const 1
            memory.atomic.notify offset=4
            drop
            br 3 (;@1;)
          end
          local.get 0
          i32.const -1073741824
          i32.const 1073741824
          i32.atomic.rmw.cmpxchg
          i32.const -1073741824
          i32.ne
          br_if 2 (;@1;)
          local.get 0
          i32.const 1
          i32.atomic.rmw.add offset=4
          drop
          local.get 0
          i32.const 1
          memory.atomic.notify offset=4
          br_if 2 (;@1;)
        end
        local.get 0
        i32.const 1073741824
        i32.const 0
        i32.atomic.rmw.cmpxchg
        i32.const 1073741824
        i32.ne
        br_if 1 (;@1;)
        local.get 0
        i32.const 2147483647
        memory.atomic.notify
        drop
        return
      end
      i32.const 1050632
      i32.const 36
      i32.const 1050668
      call $_ZN4core9panicking5panic17h5183d2125e960738E
      unreachable
    end)
  (func $_ZN3std4sync14reentrant_lock25current_thread_unique_ptr1X7__getit17ha3ae703d425817c5E.llvm.8846984551579673576 (type 10) (param i32) (result i32)
    global.get $__tls_base
    i32.const 0
    i32.add)
  (func $_ZN93_$LT$std..io..buffered..linewritershim..LineWriterShim$LT$W$GT$$u20$as$u20$std..io..Write$GT$9write_all17h06beff25007fa475E (type 7) (param i32 i32 i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    i32.const 10
    local.get 2
    local.get 3
    call $_ZN4core5slice6memchr7memrchr17h0f954a0b5e3b458fE
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 4
          i32.load
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.load
              local.tee 5
              i32.const 8
              i32.add
              i32.load
              local.tee 1
              br_if 0 (;@5;)
              i32.const 0
              local.set 1
              br 1 (;@4;)
            end
            local.get 1
            local.get 5
            i32.const 4
            i32.add
            i32.load
            i32.add
            i32.const -1
            i32.add
            i32.load8_u
            i32.const 10
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.set 1
            local.get 5
            i32.const 0
            i32.store8 offset=12
            local.get 5
            i32.const 8
            i32.add
            i32.const 0
            i32.store
          end
          block  ;; label = @4
            local.get 5
            i32.load
            local.get 1
            i32.sub
            local.get 3
            i32.gt_u
            br_if 0 (;@4;)
            local.get 0
            local.get 5
            local.get 2
            local.get 3
            call $_ZN3std2io8buffered9bufwriter18BufWriter$LT$W$GT$14write_all_cold17h71929ef15adfecaaE
            br 2 (;@2;)
          end
          local.get 5
          i32.load offset=4
          local.get 1
          i32.add
          local.get 2
          local.get 3
          memory.copy
          local.get 0
          i32.const 4
          i32.store8
          local.get 5
          i32.const 8
          i32.add
          local.get 1
          local.get 3
          i32.add
          i32.store
          br 1 (;@2;)
        end
        local.get 3
        local.get 4
        i32.load offset=4
        i32.const 1
        i32.add
        local.tee 5
        i32.lt_u
        br_if 1 (;@1;)
        block  ;; label = @3
          local.get 1
          i32.load
          local.tee 1
          i32.const 8
          i32.add
          i32.load
          local.tee 6
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.load
              local.get 6
              i32.sub
              local.get 5
              i32.le_u
              br_if 0 (;@5;)
              local.get 1
              i32.const 4
              i32.add
              i32.load
              local.get 6
              i32.add
              local.get 2
              local.get 5
              memory.copy
              local.get 1
              i32.const 8
              i32.add
              local.get 6
              local.get 5
              i32.add
              local.tee 6
              i32.store
              br 1 (;@4;)
            end
            local.get 4
            i32.const 8
            i32.add
            local.get 1
            local.get 2
            local.get 5
            call $_ZN3std2io8buffered9bufwriter18BufWriter$LT$W$GT$14write_all_cold17h71929ef15adfecaaE
            block  ;; label = @5
              local.get 4
              i32.load8_u offset=8
              i32.const 4
              i32.eq
              br_if 0 (;@5;)
              local.get 0
              local.get 4
              i64.load offset=8
              i64.store align=4
              br 3 (;@2;)
            end
            local.get 1
            i32.const 8
            i32.add
            i32.load
            local.set 6
          end
          local.get 6
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.const 0
          i32.store8 offset=12
          local.get 1
          i32.const 8
          i32.add
          i32.const 0
          i32.store
        end
        local.get 2
        local.get 5
        i32.add
        local.set 2
        block  ;; label = @3
          local.get 1
          i32.load
          local.get 3
          local.get 5
          i32.sub
          local.tee 3
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          local.get 2
          local.get 3
          call $_ZN3std2io8buffered9bufwriter18BufWriter$LT$W$GT$14write_all_cold17h71929ef15adfecaaE
          br 1 (;@2;)
        end
        local.get 1
        i32.const 4
        i32.add
        i32.load
        local.get 2
        local.get 3
        memory.copy
        local.get 0
        i32.const 4
        i32.store8
        local.get 1
        i32.const 8
        i32.add
        local.get 3
        i32.store
      end
      local.get 4
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    local.get 4
    i32.const 1
    i32.store offset=12
    local.get 4
    i32.const 1050836
    i32.store offset=8
    local.get 4
    i64.const 0
    i64.store offset=20 align=4
    local.get 4
    i32.const 1050684
    i32.store offset=16
    local.get 4
    i32.const 8
    i32.add
    i32.const 1050844
    call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
    unreachable)
  (func $_ZN4core3ptr89drop_in_place$LT$std..io..Write..write_fmt..Adapter$LT$std..io..stdio..StderrLock$GT$$GT$17hcd5e79da3f92767bE (type 0) (param i32)
    (local i32 i32 i32)
    local.get 0
    i32.load offset=4
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load8_u
        local.tee 0
        i32.const 4
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 3
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 1
      i32.load
      local.tee 2
      local.get 1
      i32.const 4
      i32.add
      i32.load
      local.tee 0
      i32.load
      call_indirect (type 0)
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        local.get 0
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 1
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end)
  (func $_ZN61_$LT$$RF$std..io..stdio..Stdout$u20$as$u20$std..io..Write$GT$9write_fmt17h811d540b6973f862E (type 6) (param i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          call $_ZN3std4sync14reentrant_lock25current_thread_unique_ptr1X7__getit17ha3ae703d425817c5E.llvm.8846984551579673576
          local.tee 4
          local.get 1
          i32.load
          i32.load
          local.tee 1
          i32.atomic.load offset=4
          i32.eq
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 1
            i32.const 0
            i32.const 1
            i32.atomic.rmw.cmpxchg
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            call $_ZN3std3sys4sync5mutex5futex5Mutex14lock_contended17h21fa872088556641E
          end
          local.get 1
          local.get 4
          i32.atomic.store offset=4
          local.get 1
          i32.const 1
          i32.store offset=8
          br 1 (;@2;)
        end
        local.get 1
        i32.load offset=8
        i32.const 1
        i32.add
        local.tee 4
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        local.get 4
        i32.store offset=8
      end
      local.get 3
      local.get 1
      i32.store offset=12
      local.get 3
      i32.const 4
      i32.store8 offset=16
      local.get 3
      local.get 3
      i32.const 12
      i32.add
      i32.store offset=24
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.const 16
            i32.add
            i32.const 1051092
            local.get 2
            call $_ZN4core3fmt5write17h55b62ec8489b4effE
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            i32.load8_u offset=16
            i32.const 4
            i32.ne
            br_if 1 (;@3;)
            local.get 0
            i32.const 1051080
            i32.store offset=4
            local.get 0
            i32.const 2
            i32.store8
            br 2 (;@2;)
          end
          local.get 0
          i32.const 4
          i32.store8
          local.get 3
          i32.load offset=20
          local.set 0
          block  ;; label = @4
            local.get 3
            i32.load8_u offset=16
            local.tee 1
            i32.const 4
            i32.gt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 3
            i32.ne
            br_if 2 (;@2;)
          end
          local.get 0
          i32.load
          local.tee 2
          local.get 0
          i32.const 4
          i32.add
          i32.load
          local.tee 1
          i32.load
          call_indirect (type 0)
          block  ;; label = @4
            local.get 1
            i32.load offset=4
            local.tee 4
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            local.get 4
            local.get 1
            i32.load offset=8
            call $__rust_dealloc
          end
          local.get 0
          i32.const 12
          i32.const 4
          call $__rust_dealloc
          br 1 (;@2;)
        end
        local.get 0
        local.get 3
        i64.load offset=16
        i64.store align=4
      end
      local.get 3
      i32.load offset=12
      local.tee 1
      local.get 1
      i32.load offset=8
      i32.const -1
      i32.add
      local.tee 0
      i32.store offset=8
      block  ;; label = @2
        local.get 0
        br_if 0 (;@2;)
        local.get 1
        i32.const 0
        i32.atomic.store offset=4
        local.get 1
        i32.const 0
        i32.atomic.rmw.xchg
        i32.const 2
        i32.ne
        br_if 0 (;@2;)
        local.get 1
        i32.const 1
        memory.atomic.notify
        drop
      end
      local.get 3
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 1050160
    i32.const 38
    i32.const 1050332
    call $_ZN4core6option13expect_failed17hc92345a96811243cE
    unreachable)
  (func $_ZN3std2io5stdio31print_to_buffer_if_capture_used17h22d3859e0e941b6eE (type 10) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    i32.const 0
    local.set 2
    block  ;; label = @1
      i32.const 0
      i32.atomic.load8_u offset=1053976
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          global.get $__tls_base
          i32.const 4
          i32.add
          local.tee 2
          i32.load
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          i32.const 4
          i32.add
          local.set 3
          br 1 (;@2;)
        end
        i32.const 0
        local.set 2
        global.get $__tls_base
        i32.const 4
        i32.add
        i32.const 0
        call $_ZN3std3sys12thread_local10fast_local12Key$LT$T$GT$14try_initialize17h47dc8302366a5cadE.llvm.11972105620972837968
        local.tee 3
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 3
      i32.load
      local.set 4
      i32.const 0
      local.set 2
      local.get 3
      i32.const 0
      i32.store
      local.get 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.const 8
      i32.add
      local.set 2
      block  ;; label = @2
        local.get 4
        i32.const 0
        i32.const 1
        i32.atomic.rmw.cmpxchg offset=8
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        call $_ZN3std3sys4sync5mutex5futex5Mutex14lock_contended17h21fa872088556641E
      end
      local.get 1
      i32.const 4
      i32.store8 offset=4
      local.get 1
      local.get 4
      i32.const 12
      i32.add
      i32.store offset=12
      local.get 1
      i32.const 4
      i32.add
      i32.const 1051116
      local.get 0
      call $_ZN4core3fmt5write17h55b62ec8489b4effE
      local.set 5
      local.get 1
      i32.load8_u offset=4
      local.set 0
      block  ;; label = @2
        block  ;; label = @3
          local.get 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          i32.const 4
          i32.eq
          br_if 1 (;@2;)
          local.get 1
          i32.load offset=8
          local.set 5
          block  ;; label = @4
            local.get 1
            i32.load8_u offset=4
            local.tee 0
            i32.const 4
            i32.gt_u
            br_if 0 (;@4;)
            local.get 0
            i32.const 3
            i32.ne
            br_if 2 (;@2;)
          end
          local.get 5
          i32.load
          local.tee 6
          local.get 5
          i32.const 4
          i32.add
          i32.load
          local.tee 0
          i32.load
          call_indirect (type 0)
          block  ;; label = @4
            local.get 0
            i32.load offset=4
            local.tee 7
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            local.get 7
            local.get 0
            i32.load offset=8
            call $__rust_dealloc
          end
          local.get 5
          i32.const 12
          i32.const 4
          call $__rust_dealloc
          br 1 (;@2;)
        end
        local.get 1
        i32.load offset=8
        local.set 5
        block  ;; label = @3
          local.get 0
          i32.const 4
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 5
        i32.load
        local.tee 6
        local.get 5
        i32.const 4
        i32.add
        i32.load
        local.tee 0
        i32.load
        call_indirect (type 0)
        block  ;; label = @3
          local.get 0
          i32.load offset=4
          local.tee 7
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          local.get 7
          local.get 0
          i32.load offset=8
          call $__rust_dealloc
        end
        local.get 5
        i32.const 12
        i32.const 4
        call $__rust_dealloc
      end
      block  ;; label = @2
        local.get 2
        i32.const 0
        i32.atomic.rmw.xchg
        i32.const 2
        i32.ne
        br_if 0 (;@2;)
        local.get 2
        i32.const 1
        memory.atomic.notify
        drop
      end
      local.get 1
      local.get 3
      i32.load
      local.tee 2
      i32.store offset=4
      local.get 3
      local.get 4
      i32.store
      block  ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.const 1
        i32.atomic.rmw.sub
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        atomic.fence
        local.get 1
        i32.const 4
        i32.add
        call $_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h272dc83cd57b5547E
      end
      i32.const 1
      local.set 2
    end
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2)
  (func $_ZN3std2io5stdio6_print17h12d72242e7805467E (type 0) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 6
    i32.store offset=12
    local.get 1
    i32.const 1051056
    i32.store offset=8
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        call $_ZN3std2io5stdio31print_to_buffer_if_capture_used17h22d3859e0e941b6eE
        br_if 0 (;@2;)
        block  ;; label = @3
          i32.const 0
          i32.atomic.load offset=1054012
          i32.const 4
          i32.eq
          br_if 0 (;@3;)
          i32.const 1053980
          call $_ZN3std4sync9once_lock17OnceLock$LT$T$GT$10initialize17h904fea820818bbc3E
        end
        local.get 1
        i32.const 1053980
        i32.store offset=28
        local.get 1
        local.get 1
        i32.const 28
        i32.add
        i32.store offset=40
        local.get 1
        i32.const 16
        i32.add
        local.get 1
        i32.const 40
        i32.add
        local.get 0
        call $_ZN61_$LT$$RF$std..io..stdio..Stdout$u20$as$u20$std..io..Write$GT$9write_fmt17h811d540b6973f862E
        local.get 1
        i32.load8_u offset=16
        i32.const 4
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 1
      i32.const 80
      i32.add
      global.set $__stack_pointer
      return
    end
    local.get 1
    local.get 1
    i64.load offset=16
    i64.store offset=32
    local.get 1
    i32.const 76
    i32.add
    i32.const 26
    i32.store
    local.get 1
    i32.const 2
    i32.store offset=44
    local.get 1
    i32.const 1051024
    i32.store offset=40
    local.get 1
    i64.const 2
    i64.store offset=52 align=4
    local.get 1
    i32.const 27
    i32.store offset=68
    local.get 1
    local.get 1
    i32.const 64
    i32.add
    i32.store offset=48
    local.get 1
    local.get 1
    i32.const 32
    i32.add
    i32.store offset=72
    local.get 1
    local.get 1
    i32.const 8
    i32.add
    i32.store offset=64
    local.get 1
    i32.const 40
    i32.add
    i32.const 1051040
    call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
    unreachable)
  (func $_ZN4core3ptr88drop_in_place$LT$std..io..Write..write_fmt..Adapter$LT$alloc..vec..Vec$LT$u8$GT$$GT$$GT$17h04373aee67a077a9E.llvm.9660907189867844885 (type 0) (param i32)
    (local i32 i32 i32)
    local.get 0
    i32.load offset=4
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load8_u
        local.tee 0
        i32.const 4
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 3
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 1
      i32.load
      local.tee 2
      local.get 1
      i32.const 4
      i32.add
      i32.load
      local.tee 0
      i32.load
      call_indirect (type 0)
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        local.get 0
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 1
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end)
  (func $_ZN4core3fmt5Write10write_char17h8fc7d1480738044bE (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i64 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 0
    i32.store offset=12
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            local.get 1
            i32.const 65536
            i32.ge_u
            br_if 2 (;@2;)
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 224
            i32.or
            i32.store8 offset=12
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            i32.const 3
            local.set 3
            br 3 (;@1;)
          end
          local.get 2
          local.get 1
          i32.store8 offset=12
          i32.const 1
          local.set 3
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=13
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 3
        br 1 (;@1;)
      end
      local.get 2
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=15
      local.get 2
      local.get 1
      i32.const 6
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=14
      local.get 2
      local.get 1
      i32.const 12
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=13
      local.get 2
      local.get 1
      i32.const 18
      i32.shr_u
      i32.const 7
      i32.and
      i32.const 240
      i32.or
      i32.store8 offset=12
      i32.const 4
      local.set 3
    end
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      i32.load
      local.tee 1
      i32.load offset=12
      br_if 0 (;@1;)
      local.get 1
      i32.const -1
      i32.store offset=12
      local.get 2
      local.get 1
      i32.const 16
      i32.add
      i32.store offset=28
      local.get 2
      i32.const 16
      i32.add
      local.get 2
      i32.const 28
      i32.add
      local.get 2
      i32.const 12
      i32.add
      local.get 3
      call $_ZN93_$LT$std..io..buffered..linewritershim..LineWriterShim$LT$W$GT$$u20$as$u20$std..io..Write$GT$9write_all17h06beff25007fa475E
      local.get 1
      local.get 1
      i32.load offset=12
      i32.const 1
      i32.add
      i32.store offset=12
      block  ;; label = @2
        local.get 2
        i32.load8_u offset=16
        local.tee 1
        i32.const 4
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=4
        local.set 4
        local.get 2
        i64.load offset=16
        local.set 5
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load8_u
            local.tee 3
            i32.const 4
            i32.gt_u
            br_if 0 (;@4;)
            local.get 3
            i32.const 3
            i32.ne
            br_if 1 (;@3;)
          end
          local.get 4
          i32.load
          local.tee 6
          local.get 4
          i32.const 4
          i32.add
          i32.load
          local.tee 3
          i32.load
          call_indirect (type 0)
          block  ;; label = @4
            local.get 3
            i32.load offset=4
            local.tee 7
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            local.get 7
            local.get 3
            i32.load offset=8
            call $__rust_dealloc
          end
          local.get 4
          i32.const 12
          i32.const 4
          call $__rust_dealloc
        end
        local.get 0
        local.get 5
        i64.store align=4
      end
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
      local.get 1
      i32.const 4
      i32.ne
      return
    end
    i32.const 1050984
    call $_ZN4core4cell22panic_already_borrowed17hfa55c2be5c5c6eb4E
    unreachable)
  (func $_ZN4core3fmt5Write10write_char17hc89cc9fd0af3e181E (type 2) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 0
    i32.store offset=12
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            local.get 1
            i32.const 65536
            i32.ge_u
            br_if 2 (;@2;)
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 224
            i32.or
            i32.store8 offset=12
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            i32.const 3
            local.set 3
            br 3 (;@1;)
          end
          local.get 2
          local.get 1
          i32.store8 offset=12
          i32.const 1
          local.set 3
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=13
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 3
        br 1 (;@1;)
      end
      local.get 2
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=15
      local.get 2
      local.get 1
      i32.const 6
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=14
      local.get 2
      local.get 1
      i32.const 12
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=13
      local.get 2
      local.get 1
      i32.const 18
      i32.shr_u
      i32.const 7
      i32.and
      i32.const 240
      i32.or
      i32.store8 offset=12
      i32.const 4
      local.set 3
    end
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      local.tee 1
      i32.load
      local.get 1
      i32.load offset=8
      local.tee 0
      i32.sub
      local.get 3
      i32.ge_u
      br_if 0 (;@1;)
      local.get 1
      local.get 0
      local.get 3
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17ha8d8870fa1fd559bE
      local.get 1
      i32.load offset=8
      local.set 0
    end
    local.get 1
    i32.load offset=4
    local.get 0
    i32.add
    local.get 2
    i32.const 12
    i32.add
    local.get 3
    memory.copy
    local.get 1
    local.get 0
    local.get 3
    i32.add
    i32.store offset=8
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    i32.const 0)
  (func $_ZN4core3fmt5Write9write_fmt17h11b5748d5310bc97E (type 2) (param i32 i32) (result i32)
    local.get 0
    i32.const 1051140
    local.get 1
    call $_ZN4core3fmt5write17h55b62ec8489b4effE)
  (func $_ZN4core3fmt5Write9write_fmt17h22fbf674e3ba7d8eE (type 2) (param i32 i32) (result i32)
    local.get 0
    i32.const 1051164
    local.get 1
    call $_ZN4core3fmt5write17h55b62ec8489b4effE)
  (func $_ZN4core3ptr88drop_in_place$LT$std..io..Write..write_fmt..Adapter$LT$alloc..vec..Vec$LT$u8$GT$$GT$$GT$17h04373aee67a077a9E (type 0) (param i32)
    (local i32 i32 i32)
    local.get 0
    i32.load offset=4
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load8_u
        local.tee 0
        i32.const 4
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 3
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 1
      i32.load
      local.tee 2
      local.get 1
      i32.const 4
      i32.add
      i32.load
      local.tee 0
      i32.load
      call_indirect (type 0)
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        local.get 0
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 1
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end)
  (func $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17h846113e4f2abcc3dE (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32 i64 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      i32.load
      local.tee 4
      i32.load offset=12
      br_if 0 (;@1;)
      local.get 4
      i32.const -1
      i32.store offset=12
      local.get 3
      local.get 4
      i32.const 16
      i32.add
      i32.store offset=12
      local.get 3
      local.get 3
      i32.const 12
      i32.add
      local.get 1
      local.get 2
      call $_ZN93_$LT$std..io..buffered..linewritershim..LineWriterShim$LT$W$GT$$u20$as$u20$std..io..Write$GT$9write_all17h06beff25007fa475E
      local.get 4
      local.get 4
      i32.load offset=12
      i32.const 1
      i32.add
      i32.store offset=12
      block  ;; label = @2
        local.get 3
        i32.load8_u
        local.tee 4
        i32.const 4
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=4
        local.set 1
        local.get 3
        i64.load
        local.set 5
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load8_u
            local.tee 2
            i32.const 4
            i32.gt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const 3
            i32.ne
            br_if 1 (;@3;)
          end
          local.get 1
          i32.load
          local.tee 6
          local.get 1
          i32.const 4
          i32.add
          i32.load
          local.tee 2
          i32.load
          call_indirect (type 0)
          block  ;; label = @4
            local.get 2
            i32.load offset=4
            local.tee 7
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            local.get 7
            local.get 2
            i32.load offset=8
            call $__rust_dealloc
          end
          local.get 1
          i32.const 12
          i32.const 4
          call $__rust_dealloc
        end
        local.get 0
        local.get 5
        i64.store align=4
      end
      local.get 3
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 4
      i32.const 4
      i32.ne
      return
    end
    i32.const 1050984
    call $_ZN4core4cell22panic_already_borrowed17hfa55c2be5c5c6eb4E
    unreachable)
  (func $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17ha64215833ac6d838E (type 3) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      local.tee 0
      i32.load
      local.get 0
      i32.load offset=8
      local.tee 3
      i32.sub
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 2
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17ha8d8870fa1fd559bE
      local.get 0
      i32.load offset=8
      local.set 3
    end
    local.get 0
    i32.load offset=4
    local.get 3
    i32.add
    local.get 1
    local.get 2
    memory.copy
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0)
  (func $_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17hfb89e3d6c2568f08E.1 (type 2) (param i32 i32) (result i32)
    local.get 0
    i32.load offset=4
    local.get 0
    i32.load offset=8
    local.get 1
    call $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h88408237604245e2E)
  (func $_ZN60_$LT$std..io..error..Error$u20$as$u20$core..fmt..Display$GT$3fmt17hf06d594d26b2c655E (type 2) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load8_u
                br_table 0 (;@6;) 1 (;@5;) 2 (;@4;) 3 (;@3;) 0 (;@6;)
              end
              local.get 2
              local.get 0
              i32.load offset=4
              i32.store offset=8
              i32.const 0
              i32.load8_u offset=1053953
              drop
              i32.const 20
              i32.const 1
              call $__rust_alloc
              local.tee 0
              i32.eqz
              br_if 4 (;@1;)
              local.get 0
              i32.const 16
              i32.add
              i32.const 0
              i32.load offset=1052572 align=1
              i32.store align=1
              local.get 0
              i32.const 8
              i32.add
              i32.const 0
              i64.load offset=1052564 align=1
              i64.store align=1
              local.get 0
              i32.const 0
              i64.load offset=1052556 align=1
              i64.store align=1
              local.get 2
              i32.const 20
              i32.store offset=20
              local.get 2
              local.get 0
              i32.store offset=16
              local.get 2
              i32.const 20
              i32.store offset=12
              local.get 2
              i32.const 36
              i32.add
              i32.const 37
              i32.store
              local.get 2
              i32.const 3
              i32.store offset=44
              local.get 2
              i32.const 1051952
              i32.store offset=40
              local.get 2
              i64.const 2
              i64.store offset=52 align=4
              local.get 2
              i32.const 38
              i32.store offset=28
              local.get 2
              local.get 2
              i32.const 24
              i32.add
              i32.store offset=48
              local.get 2
              local.get 2
              i32.const 8
              i32.add
              i32.store offset=32
              local.get 2
              local.get 2
              i32.const 12
              i32.add
              i32.store offset=24
              local.get 1
              i32.load offset=20
              local.get 1
              i32.load offset=24
              local.get 2
              i32.const 40
              i32.add
              call $_ZN4core3fmt5write17h55b62ec8489b4effE
              local.set 0
              local.get 2
              i32.load offset=12
              local.tee 1
              i32.eqz
              br_if 3 (;@2;)
              local.get 2
              i32.load offset=16
              local.get 1
              i32.const 1
              call $__rust_dealloc
              br 3 (;@2;)
            end
            local.get 0
            i32.load8_u offset=1
            local.set 0
            local.get 2
            i32.const 1
            i32.store offset=44
            local.get 2
            i32.const 1051976
            i32.store offset=40
            local.get 2
            i64.const 1
            i64.store offset=52 align=4
            local.get 2
            i32.const 27
            i32.store offset=16
            local.get 2
            local.get 0
            i32.const 2
            i32.shl
            local.tee 0
            i32.const 1051984
            i32.add
            i32.load
            i32.store offset=28
            local.get 2
            local.get 0
            i32.const 1052148
            i32.add
            i32.load
            i32.store offset=24
            local.get 2
            local.get 2
            i32.const 12
            i32.add
            i32.store offset=48
            local.get 2
            local.get 2
            i32.const 24
            i32.add
            i32.store offset=12
            local.get 1
            i32.load offset=20
            local.get 1
            i32.load offset=24
            local.get 2
            i32.const 40
            i32.add
            call $_ZN4core3fmt5write17h55b62ec8489b4effE
            local.set 0
            br 2 (;@2;)
          end
          local.get 0
          i32.load offset=4
          local.tee 0
          i32.load
          local.get 0
          i32.load offset=4
          local.get 1
          call $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h88408237604245e2E
          local.set 0
          br 1 (;@2;)
        end
        local.get 0
        i32.load offset=4
        local.tee 0
        i32.load
        local.get 1
        local.get 0
        i32.load offset=4
        i32.load offset=16
        call_indirect (type 2)
        local.set 0
      end
      local.get 2
      i32.const 64
      i32.add
      global.set $__stack_pointer
      local.get 0
      return
    end
    i32.const 1
    i32.const 20
    call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
    unreachable)
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h8a5b56aa007b533cE (type 6) (param i32 i32 i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 256
          i32.lt_u
          br_if 0 (;@3;)
          local.get 1
          i32.load offset=24
          local.set 3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 1
                i32.load offset=12
                local.tee 2
                local.get 1
                i32.ne
                br_if 0 (;@6;)
                local.get 1
                i32.const 20
                i32.const 16
                local.get 1
                i32.load offset=20
                local.tee 2
                select
                i32.add
                i32.load
                local.tee 4
                br_if 1 (;@5;)
                i32.const 0
                local.set 2
                br 2 (;@4;)
              end
              local.get 1
              i32.load offset=8
              local.tee 4
              local.get 2
              i32.store offset=12
              local.get 2
              local.get 4
              i32.store offset=8
              br 1 (;@4;)
            end
            local.get 1
            i32.const 20
            i32.add
            local.get 1
            i32.const 16
            i32.add
            local.get 2
            select
            local.set 5
            loop  ;; label = @5
              local.get 5
              local.set 6
              local.get 4
              local.tee 2
              i32.const 20
              i32.add
              local.get 2
              i32.const 16
              i32.add
              local.get 2
              i32.load offset=20
              local.tee 4
              select
              local.set 5
              local.get 2
              i32.const 20
              i32.const 16
              local.get 4
              select
              i32.add
              i32.load
              local.tee 4
              br_if 0 (;@5;)
            end
            local.get 6
            i32.const 0
            i32.store
          end
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          block  ;; label = @4
            local.get 0
            local.get 1
            i32.load offset=28
            local.tee 5
            i32.const 2
            i32.shl
            i32.add
            local.tee 4
            i32.load
            local.get 1
            i32.eq
            br_if 0 (;@4;)
            local.get 3
            i32.const 16
            i32.const 20
            local.get 3
            i32.load offset=16
            local.get 1
            i32.eq
            select
            i32.add
            local.get 2
            i32.store
            local.get 2
            i32.eqz
            br_if 3 (;@1;)
            br 2 (;@2;)
          end
          local.get 4
          local.get 2
          i32.store
          local.get 2
          br_if 1 (;@2;)
          local.get 0
          local.get 0
          i32.load offset=412
          i32.const -2
          local.get 5
          i32.rotl
          i32.and
          i32.store offset=412
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 1
          i32.load offset=12
          local.tee 4
          local.get 1
          i32.load offset=8
          local.tee 5
          i32.eq
          br_if 0 (;@3;)
          local.get 5
          local.get 4
          i32.store offset=12
          local.get 4
          local.get 5
          i32.store offset=8
          return
        end
        local.get 0
        local.get 0
        i32.load offset=408
        i32.const -2
        local.get 2
        i32.const 3
        i32.shr_u
        i32.rotl
        i32.and
        i32.store offset=408
        return
      end
      local.get 2
      local.get 3
      i32.store offset=24
      block  ;; label = @2
        local.get 1
        i32.load offset=16
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 4
        i32.store offset=16
        local.get 4
        local.get 2
        i32.store offset=24
      end
      local.get 1
      i32.load offset=20
      local.tee 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 4
      i32.store offset=20
      local.get 4
      local.get 2
      i32.store offset=24
      return
    end)
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17hc73bbef596940e15E.llvm.14233881234370288605 (type 6) (param i32 i32 i32)
    (local i32 i32 i32)
    local.get 1
    local.get 2
    i32.add
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.load offset=4
        local.tee 4
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 4
        i32.const 2
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        i32.load
        local.tee 4
        local.get 2
        i32.add
        local.set 2
        block  ;; label = @3
          local.get 1
          local.get 4
          i32.sub
          local.tee 1
          local.get 0
          i32.load offset=424
          i32.ne
          br_if 0 (;@3;)
          local.get 3
          i32.load offset=4
          local.tee 4
          i32.const 3
          i32.and
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
          local.get 3
          local.get 4
          i32.const -2
          i32.and
          i32.store offset=4
          local.get 1
          local.get 2
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          local.get 2
          i32.store offset=416
          local.get 3
          local.get 2
          i32.store
          br 2 (;@1;)
        end
        local.get 0
        local.get 1
        local.get 4
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h8a5b56aa007b533cE
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 3
              i32.load offset=4
              local.tee 4
              i32.const 2
              i32.and
              br_if 0 (;@5;)
              local.get 3
              local.get 0
              i32.load offset=428
              i32.eq
              br_if 2 (;@3;)
              local.get 3
              local.get 0
              i32.load offset=424
              i32.eq
              br_if 3 (;@2;)
              local.get 0
              local.get 3
              local.get 4
              i32.const -8
              i32.and
              local.tee 4
              call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h8a5b56aa007b533cE
              local.get 1
              local.get 4
              local.get 2
              i32.add
              local.tee 2
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 1
              local.get 2
              i32.add
              local.get 2
              i32.store
              local.get 1
              local.get 0
              i32.load offset=424
              i32.ne
              br_if 1 (;@4;)
              local.get 0
              local.get 2
              i32.store offset=416
              return
            end
            local.get 3
            local.get 4
            i32.const -2
            i32.and
            i32.store offset=4
            local.get 1
            local.get 2
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 1
            local.get 2
            i32.add
            local.get 2
            i32.store
          end
          block  ;; label = @4
            local.get 2
            i32.const 256
            i32.lt_u
            br_if 0 (;@4;)
            i32.const 31
            local.set 3
            block  ;; label = @5
              local.get 2
              i32.const 16777215
              i32.gt_u
              br_if 0 (;@5;)
              local.get 2
              i32.const 6
              local.get 2
              i32.const 8
              i32.shr_u
              i32.clz
              local.tee 3
              i32.sub
              i32.shr_u
              i32.const 1
              i32.and
              local.get 3
              i32.const 1
              i32.shl
              i32.sub
              i32.const 62
              i32.add
              local.set 3
            end
            local.get 1
            i64.const 0
            i64.store offset=16 align=4
            local.get 1
            local.get 3
            i32.store offset=28
            local.get 0
            local.get 3
            i32.const 2
            i32.shl
            i32.add
            local.set 4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load offset=412
                i32.const 1
                local.get 3
                i32.shl
                local.tee 5
                i32.and
                br_if 0 (;@6;)
                local.get 4
                local.get 1
                i32.store
                local.get 1
                local.get 4
                i32.store offset=24
                local.get 0
                local.get 0
                i32.load offset=412
                local.get 5
                i32.or
                i32.store offset=412
                br 1 (;@5;)
              end
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 4
                    i32.load
                    local.tee 4
                    i32.load offset=4
                    i32.const -8
                    i32.and
                    local.get 2
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 4
                    local.set 0
                    br 1 (;@7;)
                  end
                  local.get 2
                  i32.const 0
                  i32.const 25
                  local.get 3
                  i32.const 1
                  i32.shr_u
                  i32.sub
                  local.get 3
                  i32.const 31
                  i32.eq
                  select
                  i32.shl
                  local.set 3
                  loop  ;; label = @8
                    local.get 4
                    local.get 3
                    i32.const 29
                    i32.shr_u
                    i32.const 4
                    i32.and
                    i32.add
                    i32.const 16
                    i32.add
                    local.tee 5
                    i32.load
                    local.tee 0
                    i32.eqz
                    br_if 2 (;@6;)
                    local.get 3
                    i32.const 1
                    i32.shl
                    local.set 3
                    local.get 0
                    local.set 4
                    local.get 0
                    i32.load offset=4
                    i32.const -8
                    i32.and
                    local.get 2
                    i32.ne
                    br_if 0 (;@8;)
                  end
                end
                local.get 0
                i32.load offset=8
                local.tee 2
                local.get 1
                i32.store offset=12
                local.get 0
                local.get 1
                i32.store offset=8
                local.get 1
                i32.const 0
                i32.store offset=24
                local.get 1
                local.get 0
                i32.store offset=12
                local.get 1
                local.get 2
                i32.store offset=8
                return
              end
              local.get 5
              local.get 1
              i32.store
              local.get 1
              local.get 4
              i32.store offset=24
            end
            local.get 1
            local.get 1
            i32.store offset=12
            local.get 1
            local.get 1
            i32.store offset=8
            return
          end
          local.get 0
          local.get 2
          i32.const -8
          i32.and
          i32.add
          i32.const 144
          i32.add
          local.set 3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.load offset=408
              local.tee 4
              i32.const 1
              local.get 2
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 2
              i32.and
              br_if 0 (;@5;)
              local.get 0
              local.get 4
              local.get 2
              i32.or
              i32.store offset=408
              local.get 3
              local.set 2
              br 1 (;@4;)
            end
            local.get 3
            i32.load offset=8
            local.set 2
          end
          local.get 3
          local.get 1
          i32.store offset=8
          local.get 2
          local.get 1
          i32.store offset=12
          local.get 1
          local.get 3
          i32.store offset=12
          local.get 1
          local.get 2
          i32.store offset=8
          return
        end
        local.get 0
        local.get 1
        i32.store offset=428
        local.get 0
        local.get 0
        i32.load offset=420
        local.get 2
        i32.add
        local.tee 2
        i32.store offset=420
        local.get 1
        local.get 2
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 1
        local.get 0
        i32.load offset=424
        i32.ne
        br_if 1 (;@1;)
        local.get 0
        i32.const 0
        i32.store offset=416
        local.get 0
        i32.const 0
        i32.store offset=424
        return
      end
      local.get 1
      local.get 0
      i32.load offset=416
      local.get 2
      i32.add
      local.tee 2
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 0
      local.get 1
      i32.store offset=424
      local.get 0
      local.get 2
      i32.store offset=416
      local.get 1
      local.get 2
      i32.add
      local.get 2
      i32.store
      return
    end)
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h73476a47273f3bb9E (type 6) (param i32 i32 i32)
    (local i32 i32 i32)
    i32.const 31
    local.set 3
    block  ;; label = @1
      local.get 2
      i32.const 16777215
      i32.gt_u
      br_if 0 (;@1;)
      local.get 2
      i32.const 6
      local.get 2
      i32.const 8
      i32.shr_u
      i32.clz
      local.tee 3
      i32.sub
      i32.shr_u
      i32.const 1
      i32.and
      local.get 3
      i32.const 1
      i32.shl
      i32.sub
      i32.const 62
      i32.add
      local.set 3
    end
    local.get 1
    i64.const 0
    i64.store offset=16 align=4
    local.get 1
    local.get 3
    i32.store offset=28
    local.get 0
    local.get 3
    i32.const 2
    i32.shl
    i32.add
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=412
        i32.const 1
        local.get 3
        i32.shl
        local.tee 5
        i32.and
        br_if 0 (;@2;)
        local.get 4
        local.get 1
        i32.store
        local.get 1
        local.get 4
        i32.store offset=24
        local.get 0
        local.get 0
        i32.load offset=412
        local.get 5
        i32.or
        i32.store offset=412
        br 1 (;@1;)
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 4
            i32.load
            local.tee 4
            i32.load offset=4
            i32.const -8
            i32.and
            local.get 2
            i32.ne
            br_if 0 (;@4;)
            local.get 4
            local.set 3
            br 1 (;@3;)
          end
          local.get 2
          i32.const 0
          i32.const 25
          local.get 3
          i32.const 1
          i32.shr_u
          i32.sub
          local.get 3
          i32.const 31
          i32.eq
          select
          i32.shl
          local.set 0
          loop  ;; label = @4
            local.get 4
            local.get 0
            i32.const 29
            i32.shr_u
            i32.const 4
            i32.and
            i32.add
            i32.const 16
            i32.add
            local.tee 5
            i32.load
            local.tee 3
            i32.eqz
            br_if 2 (;@2;)
            local.get 0
            i32.const 1
            i32.shl
            local.set 0
            local.get 3
            local.set 4
            local.get 3
            i32.load offset=4
            i32.const -8
            i32.and
            local.get 2
            i32.ne
            br_if 0 (;@4;)
          end
        end
        local.get 3
        i32.load offset=8
        local.tee 0
        local.get 1
        i32.store offset=12
        local.get 3
        local.get 1
        i32.store offset=8
        local.get 1
        i32.const 0
        i32.store offset=24
        local.get 1
        local.get 3
        i32.store offset=12
        local.get 1
        local.get 0
        i32.store offset=8
        return
      end
      local.get 5
      local.get 1
      i32.store
      local.get 1
      local.get 4
      i32.store offset=24
    end
    local.get 1
    local.get 1
    i32.store offset=12
    local.get 1
    local.get 1
    i32.store offset=8)
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$4free17hc03c95c3cec481e0E (type 1) (param i32 i32)
    (local i32 i32 i32 i32 i32)
    local.get 1
    i32.const -8
    i32.add
    local.tee 2
    local.get 1
    i32.const -4
    i32.add
    i32.load
    local.tee 3
    i32.const -8
    i32.and
    local.tee 1
    i32.add
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 3
        i32.const 2
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 2
        i32.load
        local.tee 3
        local.get 1
        i32.add
        local.set 1
        block  ;; label = @3
          local.get 2
          local.get 3
          i32.sub
          local.tee 2
          local.get 0
          i32.load offset=424
          i32.ne
          br_if 0 (;@3;)
          local.get 4
          i32.load offset=4
          local.tee 3
          i32.const 3
          i32.and
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
          local.get 4
          local.get 3
          i32.const -2
          i32.and
          i32.store offset=4
          local.get 2
          local.get 1
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          local.get 1
          i32.store offset=416
          local.get 4
          local.get 1
          i32.store
          return
        end
        local.get 0
        local.get 2
        local.get 3
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h8a5b56aa007b533cE
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 4
                          i32.load offset=4
                          local.tee 3
                          i32.const 2
                          i32.and
                          br_if 0 (;@11;)
                          local.get 4
                          local.get 0
                          i32.load offset=428
                          i32.eq
                          br_if 2 (;@9;)
                          local.get 4
                          local.get 0
                          i32.load offset=424
                          i32.eq
                          br_if 9 (;@2;)
                          local.get 0
                          local.get 4
                          local.get 3
                          i32.const -8
                          i32.and
                          local.tee 3
                          call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h8a5b56aa007b533cE
                          local.get 2
                          local.get 3
                          local.get 1
                          i32.add
                          local.tee 1
                          i32.const 1
                          i32.or
                          i32.store offset=4
                          local.get 2
                          local.get 1
                          i32.add
                          local.get 1
                          i32.store
                          local.get 2
                          local.get 0
                          i32.load offset=424
                          i32.ne
                          br_if 1 (;@10;)
                          local.get 0
                          local.get 1
                          i32.store offset=416
                          return
                        end
                        local.get 4
                        local.get 3
                        i32.const -2
                        i32.and
                        i32.store offset=4
                        local.get 2
                        local.get 1
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 2
                        local.get 1
                        i32.add
                        local.get 1
                        i32.store
                      end
                      local.get 1
                      i32.const 256
                      i32.lt_u
                      br_if 4 (;@5;)
                      i32.const 31
                      local.set 4
                      block  ;; label = @10
                        local.get 1
                        i32.const 16777215
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 1
                        i32.const 6
                        local.get 1
                        i32.const 8
                        i32.shr_u
                        i32.clz
                        local.tee 4
                        i32.sub
                        i32.shr_u
                        i32.const 1
                        i32.and
                        local.get 4
                        i32.const 1
                        i32.shl
                        i32.sub
                        i32.const 62
                        i32.add
                        local.set 4
                      end
                      local.get 2
                      i64.const 0
                      i64.store offset=16 align=4
                      local.get 2
                      local.get 4
                      i32.store offset=28
                      local.get 0
                      local.get 4
                      i32.const 2
                      i32.shl
                      i32.add
                      local.set 3
                      local.get 0
                      i32.load offset=412
                      i32.const 1
                      local.get 4
                      i32.shl
                      local.tee 5
                      i32.and
                      br_if 1 (;@8;)
                      local.get 3
                      local.get 2
                      i32.store
                      local.get 2
                      local.get 3
                      i32.store offset=24
                      local.get 0
                      local.get 0
                      i32.load offset=412
                      local.get 5
                      i32.or
                      i32.store offset=412
                      br 2 (;@7;)
                    end
                    local.get 0
                    local.get 2
                    i32.store offset=428
                    local.get 0
                    local.get 0
                    i32.load offset=420
                    local.get 1
                    i32.add
                    local.tee 1
                    i32.store offset=420
                    local.get 2
                    local.get 1
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    block  ;; label = @9
                      local.get 2
                      local.get 0
                      i32.load offset=424
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 0
                      i32.const 0
                      i32.store offset=416
                      local.get 0
                      i32.const 0
                      i32.store offset=424
                    end
                    local.get 1
                    local.get 0
                    i32.load offset=440
                    i32.le_u
                    br_if 7 (;@1;)
                    block  ;; label = @9
                      local.get 1
                      i32.const 41
                      i32.lt_u
                      br_if 0 (;@9;)
                      local.get 0
                      i32.const 128
                      i32.add
                      local.set 1
                      loop  ;; label = @10
                        block  ;; label = @11
                          local.get 1
                          i32.load
                          local.tee 4
                          local.get 2
                          i32.gt_u
                          br_if 0 (;@11;)
                          local.get 4
                          local.get 1
                          i32.load offset=4
                          i32.add
                          local.get 2
                          i32.gt_u
                          br_if 2 (;@9;)
                        end
                        local.get 1
                        i32.load offset=8
                        local.tee 1
                        br_if 0 (;@10;)
                      end
                    end
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 0
                        i32.load offset=136
                        local.tee 1
                        br_if 0 (;@10;)
                        i32.const 0
                        local.set 2
                        br 1 (;@9;)
                      end
                      i32.const 0
                      local.set 2
                      loop  ;; label = @10
                        local.get 2
                        i32.const 1
                        i32.add
                        local.set 2
                        local.get 1
                        i32.load offset=8
                        local.tee 1
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 0
                    i32.const -1
                    i32.store offset=440
                    local.get 0
                    local.get 2
                    i32.const 4095
                    local.get 2
                    i32.const 4095
                    i32.gt_u
                    select
                    i32.store offset=448
                    br 7 (;@1;)
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 3
                        i32.load
                        local.tee 5
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        local.get 1
                        i32.ne
                        br_if 0 (;@10;)
                        local.get 5
                        local.set 4
                        br 1 (;@9;)
                      end
                      local.get 1
                      i32.const 0
                      i32.const 25
                      local.get 4
                      i32.const 1
                      i32.shr_u
                      i32.sub
                      local.get 4
                      i32.const 31
                      i32.eq
                      select
                      i32.shl
                      local.set 3
                      loop  ;; label = @10
                        local.get 5
                        local.get 3
                        i32.const 29
                        i32.shr_u
                        i32.const 4
                        i32.and
                        i32.add
                        i32.const 16
                        i32.add
                        local.tee 6
                        i32.load
                        local.tee 4
                        i32.eqz
                        br_if 2 (;@8;)
                        local.get 3
                        i32.const 1
                        i32.shl
                        local.set 3
                        local.get 4
                        local.set 5
                        local.get 4
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        local.get 1
                        i32.ne
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 4
                    i32.load offset=8
                    local.tee 1
                    local.get 2
                    i32.store offset=12
                    local.get 4
                    local.get 2
                    i32.store offset=8
                    local.get 2
                    i32.const 0
                    i32.store offset=24
                    local.get 2
                    local.get 4
                    i32.store offset=12
                    local.get 2
                    local.get 1
                    i32.store offset=8
                    br 2 (;@6;)
                  end
                  local.get 6
                  local.get 2
                  i32.store
                  local.get 2
                  local.get 5
                  i32.store offset=24
                end
                local.get 2
                local.get 2
                i32.store offset=12
                local.get 2
                local.get 2
                i32.store offset=8
              end
              local.get 0
              local.get 0
              i32.load offset=448
              i32.const -1
              i32.add
              local.tee 2
              i32.store offset=448
              local.get 2
              br_if 4 (;@1;)
              local.get 0
              i32.load offset=136
              local.tee 1
              br_if 1 (;@4;)
              i32.const 0
              local.set 2
              br 2 (;@3;)
            end
            local.get 0
            local.get 1
            i32.const -8
            i32.and
            i32.add
            i32.const 144
            i32.add
            local.set 4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load offset=408
                local.tee 3
                i32.const 1
                local.get 1
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee 1
                i32.and
                br_if 0 (;@6;)
                local.get 0
                local.get 3
                local.get 1
                i32.or
                i32.store offset=408
                local.get 4
                local.set 1
                br 1 (;@5;)
              end
              local.get 4
              i32.load offset=8
              local.set 1
            end
            local.get 4
            local.get 2
            i32.store offset=8
            local.get 1
            local.get 2
            i32.store offset=12
            local.get 2
            local.get 4
            i32.store offset=12
            local.get 2
            local.get 1
            i32.store offset=8
            return
          end
          i32.const 0
          local.set 2
          loop  ;; label = @4
            local.get 2
            i32.const 1
            i32.add
            local.set 2
            local.get 1
            i32.load offset=8
            local.tee 1
            br_if 0 (;@4;)
          end
        end
        local.get 0
        local.get 2
        i32.const 4095
        local.get 2
        i32.const 4095
        i32.gt_u
        select
        i32.store offset=448
        return
      end
      local.get 2
      local.get 0
      i32.load offset=416
      local.get 1
      i32.add
      local.tee 1
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 0
      local.get 2
      i32.store offset=424
      local.get 0
      local.get 1
      i32.store offset=416
      local.get 2
      local.get 1
      i32.add
      local.get 1
      i32.store
      return
    end)
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17h0a666368b1102bfeE (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 1
                    i32.const 245
                    i32.lt_u
                    br_if 0 (;@8;)
                    i32.const 0
                    local.set 3
                    local.get 1
                    i32.const -65587
                    i32.ge_u
                    br_if 7 (;@1;)
                    local.get 1
                    i32.const 11
                    i32.add
                    local.tee 3
                    i32.const -8
                    i32.and
                    local.set 4
                    local.get 0
                    i32.load offset=412
                    local.tee 5
                    i32.eqz
                    br_if 4 (;@4;)
                    i32.const 0
                    local.set 1
                    i32.const 0
                    local.set 6
                    block  ;; label = @9
                      local.get 4
                      i32.const 256
                      i32.lt_u
                      br_if 0 (;@9;)
                      i32.const 31
                      local.set 6
                      local.get 4
                      i32.const 16777215
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 4
                      i32.const 6
                      local.get 3
                      i32.const 8
                      i32.shr_u
                      i32.clz
                      local.tee 3
                      i32.sub
                      i32.shr_u
                      i32.const 1
                      i32.and
                      local.get 3
                      i32.const 1
                      i32.shl
                      i32.sub
                      i32.const 62
                      i32.add
                      local.set 6
                    end
                    i32.const 0
                    local.get 4
                    i32.sub
                    local.set 3
                    block  ;; label = @9
                      local.get 0
                      local.get 6
                      i32.const 2
                      i32.shl
                      i32.add
                      i32.load
                      local.tee 7
                      br_if 0 (;@9;)
                      i32.const 0
                      local.set 8
                      br 2 (;@7;)
                    end
                    i32.const 0
                    local.set 1
                    local.get 4
                    i32.const 0
                    i32.const 25
                    local.get 6
                    i32.const 1
                    i32.shr_u
                    i32.sub
                    local.get 6
                    i32.const 31
                    i32.eq
                    select
                    i32.shl
                    local.set 9
                    i32.const 0
                    local.set 8
                    loop  ;; label = @9
                      block  ;; label = @10
                        local.get 7
                        local.tee 7
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        local.tee 10
                        local.get 4
                        i32.lt_u
                        br_if 0 (;@10;)
                        local.get 10
                        local.get 4
                        i32.sub
                        local.tee 10
                        local.get 3
                        i32.ge_u
                        br_if 0 (;@10;)
                        local.get 10
                        local.set 3
                        local.get 7
                        local.set 8
                        local.get 10
                        br_if 0 (;@10;)
                        i32.const 0
                        local.set 3
                        local.get 7
                        local.set 8
                        local.get 7
                        local.set 1
                        br 4 (;@6;)
                      end
                      local.get 7
                      i32.load offset=20
                      local.tee 10
                      local.get 1
                      local.get 10
                      local.get 7
                      local.get 9
                      i32.const 29
                      i32.shr_u
                      i32.const 4
                      i32.and
                      i32.add
                      i32.const 16
                      i32.add
                      i32.load
                      local.tee 7
                      i32.ne
                      select
                      local.get 1
                      local.get 10
                      select
                      local.set 1
                      local.get 9
                      i32.const 1
                      i32.shl
                      local.set 9
                      local.get 7
                      i32.eqz
                      br_if 2 (;@7;)
                      br 0 (;@9;)
                    end
                  end
                  block  ;; label = @8
                    local.get 0
                    i32.load offset=408
                    local.tee 7
                    i32.const 16
                    local.get 1
                    i32.const 11
                    i32.add
                    i32.const 504
                    i32.and
                    local.get 1
                    i32.const 11
                    i32.lt_u
                    select
                    local.tee 4
                    i32.const 3
                    i32.shr_u
                    local.tee 3
                    i32.shr_u
                    local.tee 1
                    i32.const 3
                    i32.and
                    i32.eqz
                    br_if 0 (;@8;)
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 0
                        local.get 1
                        i32.const -1
                        i32.xor
                        i32.const 1
                        i32.and
                        local.get 3
                        i32.add
                        local.tee 4
                        i32.const 3
                        i32.shl
                        i32.add
                        local.tee 1
                        i32.const 144
                        i32.add
                        local.tee 3
                        local.get 1
                        i32.const 152
                        i32.add
                        i32.load
                        local.tee 1
                        i32.load offset=8
                        local.tee 8
                        i32.eq
                        br_if 0 (;@10;)
                        local.get 8
                        local.get 3
                        i32.store offset=12
                        local.get 3
                        local.get 8
                        i32.store offset=8
                        br 1 (;@9;)
                      end
                      local.get 0
                      local.get 7
                      i32.const -2
                      local.get 4
                      i32.rotl
                      i32.and
                      i32.store offset=408
                    end
                    local.get 1
                    i32.const 8
                    i32.add
                    local.set 3
                    local.get 1
                    local.get 4
                    i32.const 3
                    i32.shl
                    local.tee 4
                    i32.const 3
                    i32.or
                    i32.store offset=4
                    local.get 1
                    local.get 4
                    i32.add
                    local.tee 1
                    local.get 1
                    i32.load offset=4
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    br 7 (;@1;)
                  end
                  local.get 4
                  local.get 0
                  i32.load offset=416
                  i32.le_u
                  br_if 3 (;@4;)
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 1
                        br_if 0 (;@10;)
                        local.get 0
                        i32.load offset=412
                        local.tee 1
                        i32.eqz
                        br_if 6 (;@4;)
                        local.get 0
                        local.get 1
                        i32.ctz
                        i32.const 2
                        i32.shl
                        i32.add
                        i32.load
                        local.tee 8
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        local.get 4
                        i32.sub
                        local.set 3
                        local.get 8
                        local.set 7
                        loop  ;; label = @11
                          block  ;; label = @12
                            local.get 8
                            i32.load offset=16
                            local.tee 1
                            br_if 0 (;@12;)
                            local.get 8
                            i32.load offset=20
                            local.tee 1
                            br_if 0 (;@12;)
                            local.get 7
                            i32.load offset=24
                            local.set 6
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 7
                                  i32.load offset=12
                                  local.tee 1
                                  local.get 7
                                  i32.ne
                                  br_if 0 (;@15;)
                                  local.get 7
                                  i32.const 20
                                  i32.const 16
                                  local.get 7
                                  i32.load offset=20
                                  local.tee 1
                                  select
                                  i32.add
                                  i32.load
                                  local.tee 8
                                  br_if 1 (;@14;)
                                  i32.const 0
                                  local.set 1
                                  br 2 (;@13;)
                                end
                                local.get 7
                                i32.load offset=8
                                local.tee 8
                                local.get 1
                                i32.store offset=12
                                local.get 1
                                local.get 8
                                i32.store offset=8
                                br 1 (;@13;)
                              end
                              local.get 7
                              i32.const 20
                              i32.add
                              local.get 7
                              i32.const 16
                              i32.add
                              local.get 1
                              select
                              local.set 9
                              loop  ;; label = @14
                                local.get 9
                                local.set 10
                                local.get 8
                                local.tee 1
                                i32.const 20
                                i32.add
                                local.get 1
                                i32.const 16
                                i32.add
                                local.get 1
                                i32.load offset=20
                                local.tee 8
                                select
                                local.set 9
                                local.get 1
                                i32.const 20
                                i32.const 16
                                local.get 8
                                select
                                i32.add
                                i32.load
                                local.tee 8
                                br_if 0 (;@14;)
                              end
                              local.get 10
                              i32.const 0
                              i32.store
                            end
                            local.get 6
                            i32.eqz
                            br_if 4 (;@8;)
                            block  ;; label = @13
                              local.get 0
                              local.get 7
                              i32.load offset=28
                              local.tee 9
                              i32.const 2
                              i32.shl
                              i32.add
                              local.tee 8
                              i32.load
                              local.get 7
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 6
                              i32.const 16
                              i32.const 20
                              local.get 6
                              i32.load offset=16
                              local.get 7
                              i32.eq
                              select
                              i32.add
                              local.get 1
                              i32.store
                              local.get 1
                              i32.eqz
                              br_if 5 (;@8;)
                              br 4 (;@9;)
                            end
                            local.get 8
                            local.get 1
                            i32.store
                            local.get 1
                            br_if 3 (;@9;)
                            local.get 0
                            local.get 0
                            i32.load offset=412
                            i32.const -2
                            local.get 9
                            i32.rotl
                            i32.and
                            i32.store offset=412
                            br 4 (;@8;)
                          end
                          local.get 1
                          i32.load offset=4
                          i32.const -8
                          i32.and
                          local.get 4
                          i32.sub
                          local.tee 8
                          local.get 3
                          local.get 8
                          local.get 3
                          i32.lt_u
                          local.tee 8
                          select
                          local.set 3
                          local.get 1
                          local.get 7
                          local.get 8
                          select
                          local.set 7
                          local.get 1
                          local.set 8
                          br 0 (;@11;)
                        end
                      end
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 0
                          i32.const 144
                          i32.add
                          local.tee 10
                          local.get 1
                          local.get 3
                          i32.shl
                          i32.const 2
                          local.get 3
                          i32.shl
                          local.tee 1
                          i32.const 0
                          local.get 1
                          i32.sub
                          i32.or
                          i32.and
                          i32.ctz
                          local.tee 8
                          i32.const 3
                          i32.shl
                          i32.add
                          local.tee 3
                          local.get 3
                          i32.load offset=8
                          local.tee 1
                          i32.load offset=8
                          local.tee 9
                          i32.eq
                          br_if 0 (;@11;)
                          local.get 9
                          local.get 3
                          i32.store offset=12
                          local.get 3
                          local.get 9
                          i32.store offset=8
                          br 1 (;@10;)
                        end
                        local.get 0
                        local.get 7
                        i32.const -2
                        local.get 8
                        i32.rotl
                        i32.and
                        i32.store offset=408
                      end
                      local.get 1
                      local.get 4
                      i32.const 3
                      i32.or
                      i32.store offset=4
                      local.get 1
                      local.get 4
                      i32.add
                      local.tee 9
                      local.get 8
                      i32.const 3
                      i32.shl
                      local.tee 3
                      local.get 4
                      i32.sub
                      local.tee 8
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 1
                      local.get 3
                      i32.add
                      local.get 8
                      i32.store
                      block  ;; label = @10
                        local.get 0
                        i32.load offset=416
                        local.tee 7
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 10
                        local.get 7
                        i32.const -8
                        i32.and
                        i32.add
                        local.set 3
                        local.get 0
                        i32.load offset=424
                        local.set 4
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 0
                            i32.load offset=408
                            local.tee 10
                            i32.const 1
                            local.get 7
                            i32.const 3
                            i32.shr_u
                            i32.shl
                            local.tee 7
                            i32.and
                            br_if 0 (;@12;)
                            local.get 0
                            local.get 10
                            local.get 7
                            i32.or
                            i32.store offset=408
                            local.get 3
                            local.set 7
                            br 1 (;@11;)
                          end
                          local.get 3
                          i32.load offset=8
                          local.set 7
                        end
                        local.get 3
                        local.get 4
                        i32.store offset=8
                        local.get 7
                        local.get 4
                        i32.store offset=12
                        local.get 4
                        local.get 3
                        i32.store offset=12
                        local.get 4
                        local.get 7
                        i32.store offset=8
                      end
                      local.get 1
                      i32.const 8
                      i32.add
                      local.set 3
                      local.get 0
                      local.get 9
                      i32.store offset=424
                      local.get 0
                      local.get 8
                      i32.store offset=416
                      br 8 (;@1;)
                    end
                    local.get 1
                    local.get 6
                    i32.store offset=24
                    block  ;; label = @9
                      local.get 7
                      i32.load offset=16
                      local.tee 8
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 1
                      local.get 8
                      i32.store offset=16
                      local.get 8
                      local.get 1
                      i32.store offset=24
                    end
                    local.get 7
                    i32.load offset=20
                    local.tee 8
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 1
                    local.get 8
                    i32.store offset=20
                    local.get 8
                    local.get 1
                    i32.store offset=24
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 3
                        i32.const 16
                        i32.lt_u
                        br_if 0 (;@10;)
                        local.get 7
                        local.get 4
                        i32.const 3
                        i32.or
                        i32.store offset=4
                        local.get 7
                        local.get 4
                        i32.add
                        local.tee 4
                        local.get 3
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 4
                        local.get 3
                        i32.add
                        local.get 3
                        i32.store
                        local.get 0
                        i32.load offset=416
                        local.tee 9
                        i32.eqz
                        br_if 1 (;@9;)
                        local.get 0
                        local.get 9
                        i32.const -8
                        i32.and
                        i32.add
                        i32.const 144
                        i32.add
                        local.set 8
                        local.get 0
                        i32.load offset=424
                        local.set 1
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 0
                            i32.load offset=408
                            local.tee 10
                            i32.const 1
                            local.get 9
                            i32.const 3
                            i32.shr_u
                            i32.shl
                            local.tee 9
                            i32.and
                            br_if 0 (;@12;)
                            local.get 0
                            local.get 10
                            local.get 9
                            i32.or
                            i32.store offset=408
                            local.get 8
                            local.set 9
                            br 1 (;@11;)
                          end
                          local.get 8
                          i32.load offset=8
                          local.set 9
                        end
                        local.get 8
                        local.get 1
                        i32.store offset=8
                        local.get 9
                        local.get 1
                        i32.store offset=12
                        local.get 1
                        local.get 8
                        i32.store offset=12
                        local.get 1
                        local.get 9
                        i32.store offset=8
                        br 1 (;@9;)
                      end
                      local.get 7
                      local.get 3
                      local.get 4
                      i32.add
                      local.tee 1
                      i32.const 3
                      i32.or
                      i32.store offset=4
                      local.get 7
                      local.get 1
                      i32.add
                      local.tee 1
                      local.get 1
                      i32.load offset=4
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      br 1 (;@8;)
                    end
                    local.get 0
                    local.get 4
                    i32.store offset=424
                    local.get 0
                    local.get 3
                    i32.store offset=416
                  end
                  local.get 7
                  i32.const 8
                  i32.add
                  local.set 3
                  br 6 (;@1;)
                end
                block  ;; label = @7
                  local.get 1
                  local.get 8
                  i32.or
                  br_if 0 (;@7;)
                  i32.const 0
                  local.set 8
                  i32.const 2
                  local.get 6
                  i32.shl
                  local.tee 1
                  i32.const 0
                  local.get 1
                  i32.sub
                  i32.or
                  local.get 5
                  i32.and
                  local.tee 1
                  i32.eqz
                  br_if 3 (;@4;)
                  local.get 0
                  local.get 1
                  i32.ctz
                  i32.const 2
                  i32.shl
                  i32.add
                  i32.load
                  local.set 1
                end
                local.get 1
                i32.eqz
                br_if 1 (;@5;)
              end
              loop  ;; label = @6
                local.get 1
                local.get 8
                local.get 1
                i32.load offset=4
                i32.const -8
                i32.and
                local.tee 7
                local.get 4
                i32.sub
                local.tee 10
                local.get 3
                i32.lt_u
                local.tee 6
                select
                local.set 5
                local.get 7
                local.get 4
                i32.lt_u
                local.set 9
                local.get 10
                local.get 3
                local.get 6
                select
                local.set 10
                block  ;; label = @7
                  local.get 1
                  i32.load offset=16
                  local.tee 7
                  br_if 0 (;@7;)
                  local.get 1
                  i32.load offset=20
                  local.set 7
                end
                local.get 8
                local.get 5
                local.get 9
                select
                local.set 8
                local.get 3
                local.get 10
                local.get 9
                select
                local.set 3
                local.get 7
                local.set 1
                local.get 7
                br_if 0 (;@6;)
              end
            end
            local.get 8
            i32.eqz
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 0
              i32.load offset=416
              local.tee 1
              local.get 4
              i32.lt_u
              br_if 0 (;@5;)
              local.get 3
              local.get 1
              local.get 4
              i32.sub
              i32.ge_u
              br_if 1 (;@4;)
            end
            local.get 8
            i32.load offset=24
            local.set 6
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 8
                  i32.load offset=12
                  local.tee 1
                  local.get 8
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const 20
                  i32.const 16
                  local.get 8
                  i32.load offset=20
                  local.tee 1
                  select
                  i32.add
                  i32.load
                  local.tee 7
                  br_if 1 (;@6;)
                  i32.const 0
                  local.set 1
                  br 2 (;@5;)
                end
                local.get 8
                i32.load offset=8
                local.tee 7
                local.get 1
                i32.store offset=12
                local.get 1
                local.get 7
                i32.store offset=8
                br 1 (;@5;)
              end
              local.get 8
              i32.const 20
              i32.add
              local.get 8
              i32.const 16
              i32.add
              local.get 1
              select
              local.set 9
              loop  ;; label = @6
                local.get 9
                local.set 10
                local.get 7
                local.tee 1
                i32.const 20
                i32.add
                local.get 1
                i32.const 16
                i32.add
                local.get 1
                i32.load offset=20
                local.tee 7
                select
                local.set 9
                local.get 1
                i32.const 20
                i32.const 16
                local.get 7
                select
                i32.add
                i32.load
                local.tee 7
                br_if 0 (;@6;)
              end
              local.get 10
              i32.const 0
              i32.store
            end
            local.get 6
            i32.eqz
            br_if 2 (;@2;)
            block  ;; label = @5
              local.get 0
              local.get 8
              i32.load offset=28
              local.tee 9
              i32.const 2
              i32.shl
              i32.add
              local.tee 7
              i32.load
              local.get 8
              i32.eq
              br_if 0 (;@5;)
              local.get 6
              i32.const 16
              i32.const 20
              local.get 6
              i32.load offset=16
              local.get 8
              i32.eq
              select
              i32.add
              local.get 1
              i32.store
              local.get 1
              i32.eqz
              br_if 3 (;@2;)
              br 2 (;@3;)
            end
            local.get 7
            local.get 1
            i32.store
            local.get 1
            br_if 1 (;@3;)
            local.get 0
            local.get 0
            i32.load offset=412
            i32.const -2
            local.get 9
            i32.rotl
            i32.and
            i32.store offset=412
            br 2 (;@2;)
          end
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 0
                      i32.load offset=416
                      local.tee 1
                      local.get 4
                      i32.ge_u
                      br_if 0 (;@9;)
                      block  ;; label = @10
                        local.get 0
                        i32.load offset=420
                        local.tee 1
                        local.get 4
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 2
                        i32.const 4
                        i32.add
                        local.get 0
                        i32.const 452
                        i32.add
                        local.get 4
                        i32.const 65583
                        i32.add
                        i32.const -65536
                        i32.and
                        call $_ZN61_$LT$dlmalloc..sys..System$u20$as$u20$dlmalloc..Allocator$GT$5alloc17h293f24278785f002E
                        i32.const 0
                        local.set 3
                        local.get 2
                        i32.load offset=4
                        local.tee 9
                        i32.eqz
                        br_if 9 (;@1;)
                        local.get 2
                        i32.load offset=12
                        local.set 11
                        local.get 0
                        local.get 0
                        i32.load offset=432
                        local.get 2
                        i32.load offset=8
                        local.tee 6
                        i32.add
                        local.tee 1
                        i32.store offset=432
                        local.get 0
                        local.get 0
                        i32.load offset=436
                        local.tee 8
                        local.get 1
                        local.get 8
                        local.get 1
                        i32.gt_u
                        select
                        i32.store offset=436
                        block  ;; label = @11
                          local.get 0
                          i32.load offset=428
                          local.tee 8
                          br_if 0 (;@11;)
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 0
                              i32.load offset=444
                              local.tee 1
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 9
                              local.get 1
                              i32.ge_u
                              br_if 1 (;@12;)
                            end
                            local.get 0
                            local.get 9
                            i32.store offset=444
                          end
                          local.get 0
                          i32.const 4095
                          i32.store offset=448
                          local.get 0
                          local.get 11
                          i32.store offset=140
                          local.get 0
                          local.get 6
                          i32.store offset=132
                          local.get 0
                          local.get 9
                          i32.store offset=128
                          local.get 0
                          local.get 0
                          i32.const 144
                          i32.add
                          local.tee 1
                          i32.store offset=156
                          local.get 0
                          local.get 0
                          i32.const 152
                          i32.add
                          local.tee 8
                          i32.store offset=164
                          local.get 0
                          local.get 1
                          i32.store offset=152
                          local.get 0
                          local.get 0
                          i32.const 160
                          i32.add
                          local.tee 1
                          i32.store offset=172
                          local.get 0
                          local.get 8
                          i32.store offset=160
                          local.get 0
                          local.get 0
                          i32.const 168
                          i32.add
                          local.tee 8
                          i32.store offset=180
                          local.get 0
                          local.get 1
                          i32.store offset=168
                          local.get 0
                          local.get 0
                          i32.const 176
                          i32.add
                          local.tee 1
                          i32.store offset=188
                          local.get 0
                          local.get 8
                          i32.store offset=176
                          local.get 0
                          local.get 0
                          i32.const 184
                          i32.add
                          local.tee 8
                          i32.store offset=196
                          local.get 0
                          local.get 1
                          i32.store offset=184
                          local.get 0
                          local.get 0
                          i32.const 192
                          i32.add
                          local.tee 1
                          i32.store offset=204
                          local.get 0
                          local.get 8
                          i32.store offset=192
                          local.get 0
                          local.get 0
                          i32.const 200
                          i32.add
                          local.tee 8
                          i32.store offset=212
                          local.get 0
                          local.get 1
                          i32.store offset=200
                          local.get 0
                          local.get 0
                          i32.const 208
                          i32.add
                          local.tee 1
                          i32.store offset=220
                          local.get 0
                          local.get 8
                          i32.store offset=208
                          local.get 0
                          local.get 1
                          i32.store offset=216
                          local.get 0
                          local.get 0
                          i32.const 216
                          i32.add
                          local.tee 1
                          i32.store offset=228
                          local.get 0
                          local.get 1
                          i32.store offset=224
                          local.get 0
                          local.get 0
                          i32.const 224
                          i32.add
                          local.tee 1
                          i32.store offset=236
                          local.get 0
                          local.get 1
                          i32.store offset=232
                          local.get 0
                          local.get 0
                          i32.const 232
                          i32.add
                          local.tee 1
                          i32.store offset=244
                          local.get 0
                          local.get 1
                          i32.store offset=240
                          local.get 0
                          local.get 0
                          i32.const 240
                          i32.add
                          local.tee 1
                          i32.store offset=252
                          local.get 0
                          local.get 1
                          i32.store offset=248
                          local.get 0
                          local.get 0
                          i32.const 248
                          i32.add
                          local.tee 1
                          i32.store offset=260
                          local.get 0
                          local.get 1
                          i32.store offset=256
                          local.get 0
                          local.get 0
                          i32.const 256
                          i32.add
                          local.tee 1
                          i32.store offset=268
                          local.get 0
                          local.get 1
                          i32.store offset=264
                          local.get 0
                          local.get 0
                          i32.const 264
                          i32.add
                          local.tee 1
                          i32.store offset=276
                          local.get 0
                          local.get 1
                          i32.store offset=272
                          local.get 0
                          local.get 0
                          i32.const 272
                          i32.add
                          local.tee 1
                          i32.store offset=284
                          local.get 0
                          local.get 0
                          i32.const 280
                          i32.add
                          local.tee 8
                          i32.store offset=292
                          local.get 0
                          local.get 1
                          i32.store offset=280
                          local.get 0
                          local.get 0
                          i32.const 288
                          i32.add
                          local.tee 1
                          i32.store offset=300
                          local.get 0
                          local.get 8
                          i32.store offset=288
                          local.get 0
                          local.get 0
                          i32.const 296
                          i32.add
                          local.tee 8
                          i32.store offset=308
                          local.get 0
                          local.get 1
                          i32.store offset=296
                          local.get 0
                          local.get 0
                          i32.const 304
                          i32.add
                          local.tee 1
                          i32.store offset=316
                          local.get 0
                          local.get 8
                          i32.store offset=304
                          local.get 0
                          local.get 0
                          i32.const 312
                          i32.add
                          local.tee 8
                          i32.store offset=324
                          local.get 0
                          local.get 1
                          i32.store offset=312
                          local.get 0
                          local.get 0
                          i32.const 320
                          i32.add
                          local.tee 1
                          i32.store offset=332
                          local.get 0
                          local.get 8
                          i32.store offset=320
                          local.get 0
                          local.get 0
                          i32.const 328
                          i32.add
                          local.tee 8
                          i32.store offset=340
                          local.get 0
                          local.get 1
                          i32.store offset=328
                          local.get 0
                          local.get 0
                          i32.const 336
                          i32.add
                          local.tee 1
                          i32.store offset=348
                          local.get 0
                          local.get 8
                          i32.store offset=336
                          local.get 0
                          local.get 0
                          i32.const 344
                          i32.add
                          local.tee 8
                          i32.store offset=356
                          local.get 0
                          local.get 1
                          i32.store offset=344
                          local.get 0
                          local.get 0
                          i32.const 352
                          i32.add
                          local.tee 1
                          i32.store offset=364
                          local.get 0
                          local.get 8
                          i32.store offset=352
                          local.get 0
                          local.get 0
                          i32.const 360
                          i32.add
                          local.tee 8
                          i32.store offset=372
                          local.get 0
                          local.get 1
                          i32.store offset=360
                          local.get 0
                          local.get 0
                          i32.const 368
                          i32.add
                          local.tee 1
                          i32.store offset=380
                          local.get 0
                          local.get 8
                          i32.store offset=368
                          local.get 0
                          local.get 0
                          i32.const 376
                          i32.add
                          local.tee 8
                          i32.store offset=388
                          local.get 0
                          local.get 1
                          i32.store offset=376
                          local.get 0
                          local.get 0
                          i32.const 384
                          i32.add
                          local.tee 1
                          i32.store offset=396
                          local.get 0
                          local.get 8
                          i32.store offset=384
                          local.get 0
                          local.get 0
                          i32.const 392
                          i32.add
                          local.tee 8
                          i32.store offset=404
                          local.get 0
                          local.get 1
                          i32.store offset=392
                          local.get 0
                          local.get 8
                          i32.store offset=400
                          local.get 0
                          local.get 9
                          i32.const 15
                          i32.add
                          i32.const -8
                          i32.and
                          local.tee 1
                          i32.const -8
                          i32.add
                          local.tee 8
                          i32.store offset=428
                          local.get 8
                          local.get 9
                          local.get 1
                          i32.sub
                          local.get 6
                          i32.const -40
                          i32.add
                          local.tee 1
                          i32.add
                          i32.const 8
                          i32.add
                          local.tee 7
                          i32.const 1
                          i32.or
                          i32.store offset=4
                          local.get 0
                          local.get 7
                          i32.store offset=420
                          local.get 9
                          local.get 1
                          i32.add
                          i32.const 40
                          i32.store offset=4
                          local.get 0
                          i32.const 2097152
                          i32.store offset=440
                          br 7 (;@4;)
                        end
                        local.get 0
                        i32.const 128
                        i32.add
                        local.tee 5
                        local.set 1
                        block  ;; label = @11
                          block  ;; label = @12
                            loop  ;; label = @13
                              local.get 9
                              local.get 1
                              i32.load
                              local.tee 7
                              local.get 1
                              i32.load offset=4
                              local.tee 10
                              i32.add
                              i32.eq
                              br_if 1 (;@12;)
                              local.get 1
                              i32.load offset=8
                              local.tee 1
                              br_if 0 (;@13;)
                              br 2 (;@11;)
                            end
                          end
                          local.get 8
                          local.get 9
                          i32.ge_u
                          br_if 0 (;@11;)
                          local.get 7
                          local.get 8
                          i32.gt_u
                          br_if 0 (;@11;)
                          local.get 1
                          i32.load offset=12
                          local.tee 7
                          i32.const 1
                          i32.and
                          br_if 0 (;@11;)
                          local.get 7
                          i32.const 1
                          i32.shr_u
                          local.get 11
                          i32.eq
                          br_if 3 (;@8;)
                        end
                        local.get 0
                        local.get 0
                        i32.load offset=444
                        local.tee 1
                        local.get 9
                        local.get 9
                        local.get 1
                        i32.gt_u
                        select
                        i32.store offset=444
                        local.get 9
                        local.get 6
                        i32.add
                        local.set 7
                        local.get 5
                        local.set 1
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              loop  ;; label = @14
                                local.get 1
                                i32.load
                                local.get 7
                                i32.eq
                                br_if 1 (;@13;)
                                local.get 1
                                i32.load offset=8
                                local.tee 1
                                br_if 0 (;@14;)
                                br 2 (;@12;)
                              end
                            end
                            local.get 1
                            i32.load offset=12
                            local.tee 10
                            i32.const 1
                            i32.and
                            br_if 0 (;@12;)
                            local.get 10
                            i32.const 1
                            i32.shr_u
                            local.get 11
                            i32.eq
                            br_if 1 (;@11;)
                          end
                          local.get 5
                          local.set 1
                          block  ;; label = @12
                            loop  ;; label = @13
                              block  ;; label = @14
                                local.get 1
                                i32.load
                                local.tee 7
                                local.get 8
                                i32.gt_u
                                br_if 0 (;@14;)
                                local.get 7
                                local.get 1
                                i32.load offset=4
                                i32.add
                                local.tee 7
                                local.get 8
                                i32.gt_u
                                br_if 2 (;@12;)
                              end
                              local.get 1
                              i32.load offset=8
                              local.set 1
                              br 0 (;@13;)
                            end
                          end
                          local.get 9
                          i32.const 15
                          i32.add
                          i32.const -8
                          i32.and
                          local.tee 1
                          i32.const -8
                          i32.add
                          local.tee 12
                          local.get 9
                          local.get 1
                          i32.sub
                          local.get 6
                          i32.const -40
                          i32.add
                          local.tee 1
                          i32.add
                          i32.const 8
                          i32.add
                          local.tee 13
                          i32.const 1
                          i32.or
                          i32.store offset=4
                          local.get 9
                          local.get 1
                          i32.add
                          i32.const 40
                          i32.store offset=4
                          local.get 8
                          local.get 7
                          i32.const -32
                          i32.add
                          i32.const -8
                          i32.and
                          i32.const -8
                          i32.add
                          local.tee 1
                          local.get 1
                          local.get 8
                          i32.const 16
                          i32.add
                          i32.lt_u
                          select
                          local.tee 10
                          i32.const 27
                          i32.store offset=4
                          local.get 0
                          i32.const 2097152
                          i32.store offset=440
                          local.get 0
                          local.get 12
                          i32.store offset=428
                          local.get 0
                          local.get 13
                          i32.store offset=420
                          local.get 5
                          i64.load align=4
                          local.set 14
                          local.get 10
                          i32.const 16
                          i32.add
                          local.get 5
                          i32.const 8
                          i32.add
                          i64.load align=4
                          i64.store align=4
                          local.get 10
                          local.get 14
                          i64.store offset=8 align=4
                          local.get 0
                          local.get 11
                          i32.store offset=140
                          local.get 0
                          local.get 6
                          i32.store offset=132
                          local.get 0
                          local.get 9
                          i32.store offset=128
                          local.get 0
                          local.get 10
                          i32.const 8
                          i32.add
                          i32.store offset=136
                          local.get 10
                          i32.const 28
                          i32.add
                          local.set 1
                          loop  ;; label = @12
                            local.get 1
                            i32.const 7
                            i32.store
                            local.get 1
                            i32.const 4
                            i32.add
                            local.tee 1
                            local.get 7
                            i32.lt_u
                            br_if 0 (;@12;)
                          end
                          local.get 10
                          local.get 8
                          i32.eq
                          br_if 7 (;@4;)
                          local.get 10
                          local.get 10
                          i32.load offset=4
                          i32.const -2
                          i32.and
                          i32.store offset=4
                          local.get 8
                          local.get 10
                          local.get 8
                          i32.sub
                          local.tee 1
                          i32.const 1
                          i32.or
                          i32.store offset=4
                          local.get 10
                          local.get 1
                          i32.store
                          block  ;; label = @12
                            local.get 1
                            i32.const 256
                            i32.lt_u
                            br_if 0 (;@12;)
                            local.get 0
                            local.get 8
                            local.get 1
                            call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h73476a47273f3bb9E
                            br 8 (;@4;)
                          end
                          local.get 0
                          local.get 1
                          i32.const -8
                          i32.and
                          i32.add
                          i32.const 144
                          i32.add
                          local.set 7
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 0
                              i32.load offset=408
                              local.tee 9
                              i32.const 1
                              local.get 1
                              i32.const 3
                              i32.shr_u
                              i32.shl
                              local.tee 1
                              i32.and
                              br_if 0 (;@13;)
                              local.get 0
                              local.get 9
                              local.get 1
                              i32.or
                              i32.store offset=408
                              local.get 7
                              local.set 1
                              br 1 (;@12;)
                            end
                            local.get 7
                            i32.load offset=8
                            local.set 1
                          end
                          local.get 7
                          local.get 8
                          i32.store offset=8
                          local.get 1
                          local.get 8
                          i32.store offset=12
                          local.get 8
                          local.get 7
                          i32.store offset=12
                          local.get 8
                          local.get 1
                          i32.store offset=8
                          br 7 (;@4;)
                        end
                        local.get 1
                        local.get 9
                        i32.store
                        local.get 1
                        local.get 1
                        i32.load offset=4
                        local.get 6
                        i32.add
                        i32.store offset=4
                        local.get 9
                        i32.const 15
                        i32.add
                        i32.const -8
                        i32.and
                        i32.const -8
                        i32.add
                        local.tee 8
                        local.get 4
                        i32.const 3
                        i32.or
                        i32.store offset=4
                        local.get 7
                        i32.const 15
                        i32.add
                        i32.const -8
                        i32.and
                        i32.const -8
                        i32.add
                        local.tee 3
                        local.get 8
                        local.get 4
                        i32.add
                        local.tee 1
                        i32.sub
                        local.set 4
                        local.get 3
                        local.get 0
                        i32.load offset=428
                        i32.eq
                        br_if 3 (;@7;)
                        local.get 3
                        local.get 0
                        i32.load offset=424
                        i32.eq
                        br_if 4 (;@6;)
                        block  ;; label = @11
                          local.get 3
                          i32.load offset=4
                          local.tee 7
                          i32.const 3
                          i32.and
                          i32.const 1
                          i32.ne
                          br_if 0 (;@11;)
                          local.get 0
                          local.get 3
                          local.get 7
                          i32.const -8
                          i32.and
                          local.tee 7
                          call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h8a5b56aa007b533cE
                          local.get 7
                          local.get 4
                          i32.add
                          local.set 4
                          local.get 3
                          local.get 7
                          i32.add
                          local.tee 3
                          i32.load offset=4
                          local.set 7
                        end
                        local.get 3
                        local.get 7
                        i32.const -2
                        i32.and
                        i32.store offset=4
                        local.get 1
                        local.get 4
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 1
                        local.get 4
                        i32.add
                        local.get 4
                        i32.store
                        block  ;; label = @11
                          local.get 4
                          i32.const 256
                          i32.lt_u
                          br_if 0 (;@11;)
                          local.get 0
                          local.get 1
                          local.get 4
                          call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h73476a47273f3bb9E
                          br 6 (;@5;)
                        end
                        local.get 0
                        local.get 4
                        i32.const -8
                        i32.and
                        i32.add
                        i32.const 144
                        i32.add
                        local.set 3
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 0
                            i32.load offset=408
                            local.tee 7
                            i32.const 1
                            local.get 4
                            i32.const 3
                            i32.shr_u
                            i32.shl
                            local.tee 4
                            i32.and
                            br_if 0 (;@12;)
                            local.get 0
                            local.get 7
                            local.get 4
                            i32.or
                            i32.store offset=408
                            local.get 3
                            local.set 4
                            br 1 (;@11;)
                          end
                          local.get 3
                          i32.load offset=8
                          local.set 4
                        end
                        local.get 3
                        local.get 1
                        i32.store offset=8
                        local.get 4
                        local.get 1
                        i32.store offset=12
                        local.get 1
                        local.get 3
                        i32.store offset=12
                        local.get 1
                        local.get 4
                        i32.store offset=8
                        br 5 (;@5;)
                      end
                      local.get 0
                      local.get 1
                      local.get 4
                      i32.sub
                      local.tee 3
                      i32.store offset=420
                      local.get 0
                      local.get 0
                      i32.load offset=428
                      local.tee 1
                      local.get 4
                      i32.add
                      local.tee 8
                      i32.store offset=428
                      local.get 8
                      local.get 3
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 1
                      local.get 4
                      i32.const 3
                      i32.or
                      i32.store offset=4
                      local.get 1
                      i32.const 8
                      i32.add
                      local.set 3
                      br 8 (;@1;)
                    end
                    local.get 0
                    i32.load offset=424
                    local.set 3
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 1
                        local.get 4
                        i32.sub
                        local.tee 8
                        i32.const 15
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 0
                        i32.const 0
                        i32.store offset=424
                        local.get 0
                        i32.const 0
                        i32.store offset=416
                        local.get 3
                        local.get 1
                        i32.const 3
                        i32.or
                        i32.store offset=4
                        local.get 3
                        local.get 1
                        i32.add
                        local.tee 1
                        local.get 1
                        i32.load offset=4
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        br 1 (;@9;)
                      end
                      local.get 0
                      local.get 8
                      i32.store offset=416
                      local.get 0
                      local.get 3
                      local.get 4
                      i32.add
                      local.tee 7
                      i32.store offset=424
                      local.get 7
                      local.get 8
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 3
                      local.get 1
                      i32.add
                      local.get 8
                      i32.store
                      local.get 3
                      local.get 4
                      i32.const 3
                      i32.or
                      i32.store offset=4
                    end
                    local.get 3
                    i32.const 8
                    i32.add
                    local.set 3
                    br 7 (;@1;)
                  end
                  local.get 1
                  local.get 10
                  local.get 6
                  i32.add
                  i32.store offset=4
                  local.get 0
                  i32.load offset=428
                  local.tee 1
                  i32.const 15
                  i32.add
                  i32.const -8
                  i32.and
                  local.tee 8
                  i32.const -8
                  i32.add
                  local.tee 7
                  local.get 1
                  local.get 8
                  i32.sub
                  local.get 0
                  i32.load offset=420
                  local.get 6
                  i32.add
                  local.tee 8
                  i32.add
                  i32.const 8
                  i32.add
                  local.tee 9
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 0
                  i32.const 2097152
                  i32.store offset=440
                  local.get 0
                  local.get 7
                  i32.store offset=428
                  local.get 0
                  local.get 9
                  i32.store offset=420
                  local.get 1
                  local.get 8
                  i32.add
                  i32.const 40
                  i32.store offset=4
                  br 3 (;@4;)
                end
                local.get 0
                local.get 1
                i32.store offset=428
                local.get 0
                local.get 0
                i32.load offset=420
                local.get 4
                i32.add
                local.tee 4
                i32.store offset=420
                local.get 1
                local.get 4
                i32.const 1
                i32.or
                i32.store offset=4
                br 1 (;@5;)
              end
              local.get 1
              local.get 0
              i32.load offset=416
              local.get 4
              i32.add
              local.tee 4
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 0
              local.get 1
              i32.store offset=424
              local.get 0
              local.get 4
              i32.store offset=416
              local.get 1
              local.get 4
              i32.add
              local.get 4
              i32.store
            end
            local.get 8
            i32.const 8
            i32.add
            local.set 3
            br 3 (;@1;)
          end
          local.get 0
          i32.load offset=420
          local.tee 1
          local.get 4
          i32.le_u
          br_if 2 (;@1;)
          local.get 0
          local.get 1
          local.get 4
          i32.sub
          local.tee 3
          i32.store offset=420
          local.get 0
          local.get 0
          i32.load offset=428
          local.tee 1
          local.get 4
          i32.add
          local.tee 8
          i32.store offset=428
          local.get 8
          local.get 3
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 1
          local.get 4
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 1
          i32.const 8
          i32.add
          local.set 3
          br 2 (;@1;)
        end
        local.get 1
        local.get 6
        i32.store offset=24
        block  ;; label = @3
          local.get 8
          i32.load offset=16
          local.tee 7
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          local.get 7
          i32.store offset=16
          local.get 7
          local.get 1
          i32.store offset=24
        end
        local.get 8
        i32.load offset=20
        local.tee 7
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 7
        i32.store offset=20
        local.get 7
        local.get 1
        i32.store offset=24
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 8
          local.get 4
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 8
          local.get 4
          i32.add
          local.tee 1
          local.get 3
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 1
          local.get 3
          i32.add
          local.get 3
          i32.store
          block  ;; label = @4
            local.get 3
            i32.const 256
            i32.lt_u
            br_if 0 (;@4;)
            local.get 0
            local.get 1
            local.get 3
            call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h73476a47273f3bb9E
            br 2 (;@2;)
          end
          local.get 0
          local.get 3
          i32.const -8
          i32.and
          i32.add
          i32.const 144
          i32.add
          local.set 4
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.load offset=408
              local.tee 7
              i32.const 1
              local.get 3
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 3
              i32.and
              br_if 0 (;@5;)
              local.get 0
              local.get 7
              local.get 3
              i32.or
              i32.store offset=408
              local.get 4
              local.set 3
              br 1 (;@4;)
            end
            local.get 4
            i32.load offset=8
            local.set 3
          end
          local.get 4
          local.get 1
          i32.store offset=8
          local.get 3
          local.get 1
          i32.store offset=12
          local.get 1
          local.get 4
          i32.store offset=12
          local.get 1
          local.get 3
          i32.store offset=8
          br 1 (;@2;)
        end
        local.get 8
        local.get 3
        local.get 4
        i32.add
        local.tee 1
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 8
        local.get 1
        i32.add
        local.tee 1
        local.get 1
        i32.load offset=4
        i32.const 1
        i32.or
        i32.store offset=4
      end
      local.get 8
      i32.const 8
      i32.add
      local.set 3
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 3)
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$7realloc17hb891c38c98b4199eE (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    i32.const 0
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const -65588
        i32.gt_u
        br_if 0 (;@2;)
        i32.const 16
        local.get 2
        i32.const 11
        i32.add
        i32.const -8
        i32.and
        local.get 2
        i32.const 11
        i32.lt_u
        select
        local.set 4
        local.get 1
        i32.const -4
        i32.add
        local.tee 5
        i32.load
        local.tee 6
        i32.const -8
        i32.and
        local.set 7
        block  ;; label = @3
          block  ;; label = @4
            local.get 6
            i32.const 3
            i32.and
            br_if 0 (;@4;)
            local.get 4
            i32.const 256
            i32.lt_u
            br_if 1 (;@3;)
            local.get 7
            local.get 4
            i32.const 4
            i32.or
            i32.lt_u
            br_if 1 (;@3;)
            local.get 7
            local.get 4
            i32.sub
            i32.const 131073
            i32.ge_u
            br_if 1 (;@3;)
            local.get 1
            return
          end
          local.get 1
          i32.const -8
          i32.add
          local.tee 8
          local.get 7
          i32.add
          local.set 9
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 7
                    local.get 4
                    i32.ge_u
                    br_if 0 (;@8;)
                    local.get 9
                    local.get 0
                    i32.load offset=428
                    i32.eq
                    br_if 4 (;@4;)
                    local.get 9
                    local.get 0
                    i32.load offset=424
                    i32.eq
                    br_if 2 (;@6;)
                    local.get 9
                    i32.load offset=4
                    local.tee 6
                    i32.const 2
                    i32.and
                    br_if 5 (;@3;)
                    local.get 6
                    i32.const -8
                    i32.and
                    local.tee 6
                    local.get 7
                    i32.add
                    local.tee 7
                    local.get 4
                    i32.lt_u
                    br_if 5 (;@3;)
                    local.get 0
                    local.get 9
                    local.get 6
                    call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h8a5b56aa007b533cE
                    local.get 7
                    local.get 4
                    i32.sub
                    local.tee 2
                    i32.const 16
                    i32.lt_u
                    br_if 1 (;@7;)
                    local.get 5
                    local.get 4
                    local.get 5
                    i32.load
                    i32.const 1
                    i32.and
                    i32.or
                    i32.const 2
                    i32.or
                    i32.store
                    local.get 8
                    local.get 4
                    i32.add
                    local.tee 3
                    local.get 2
                    i32.const 3
                    i32.or
                    i32.store offset=4
                    local.get 8
                    local.get 7
                    i32.add
                    local.tee 4
                    local.get 4
                    i32.load offset=4
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 0
                    local.get 3
                    local.get 2
                    call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17hc73bbef596940e15E.llvm.14233881234370288605
                    local.get 1
                    return
                  end
                  local.get 7
                  local.get 4
                  i32.sub
                  local.tee 2
                  i32.const 15
                  i32.gt_u
                  br_if 2 (;@5;)
                  local.get 1
                  return
                end
                local.get 5
                local.get 7
                local.get 5
                i32.load
                i32.const 1
                i32.and
                i32.or
                i32.const 2
                i32.or
                i32.store
                local.get 8
                local.get 7
                i32.add
                local.tee 2
                local.get 2
                i32.load offset=4
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 1
                return
              end
              local.get 0
              i32.load offset=416
              local.get 7
              i32.add
              local.tee 7
              local.get 4
              i32.lt_u
              br_if 2 (;@3;)
              block  ;; label = @6
                block  ;; label = @7
                  local.get 7
                  local.get 4
                  i32.sub
                  local.tee 2
                  i32.const 15
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 5
                  local.get 6
                  i32.const 1
                  i32.and
                  local.get 7
                  i32.or
                  i32.const 2
                  i32.or
                  i32.store
                  local.get 8
                  local.get 7
                  i32.add
                  local.tee 2
                  local.get 2
                  i32.load offset=4
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  i32.const 0
                  local.set 2
                  i32.const 0
                  local.set 3
                  br 1 (;@6;)
                end
                local.get 5
                local.get 4
                local.get 6
                i32.const 1
                i32.and
                i32.or
                i32.const 2
                i32.or
                i32.store
                local.get 8
                local.get 4
                i32.add
                local.tee 3
                local.get 2
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 8
                local.get 7
                i32.add
                local.tee 4
                local.get 2
                i32.store
                local.get 4
                local.get 4
                i32.load offset=4
                i32.const -2
                i32.and
                i32.store offset=4
              end
              local.get 0
              local.get 3
              i32.store offset=424
              local.get 0
              local.get 2
              i32.store offset=416
              local.get 1
              return
            end
            local.get 5
            local.get 4
            local.get 6
            i32.const 1
            i32.and
            i32.or
            i32.const 2
            i32.or
            i32.store
            local.get 8
            local.get 4
            i32.add
            local.tee 3
            local.get 2
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 9
            local.get 9
            i32.load offset=4
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            local.get 3
            local.get 2
            call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17hc73bbef596940e15E.llvm.14233881234370288605
            local.get 1
            return
          end
          local.get 0
          i32.load offset=420
          local.get 7
          i32.add
          local.tee 7
          local.get 4
          i32.gt_u
          br_if 2 (;@1;)
        end
        local.get 0
        local.get 2
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17h0a666368b1102bfeE
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        local.get 1
        i32.const -4
        i32.const -8
        local.get 5
        i32.load
        local.tee 3
        i32.const 3
        i32.and
        select
        local.get 3
        i32.const -8
        i32.and
        i32.add
        local.tee 3
        local.get 2
        local.get 3
        local.get 2
        i32.lt_u
        select
        memory.copy
        local.get 0
        local.get 1
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$4free17hc03c95c3cec481e0E
        local.get 4
        local.set 3
      end
      local.get 3
      return
    end
    local.get 5
    local.get 4
    local.get 6
    i32.const 1
    i32.and
    i32.or
    i32.const 2
    i32.or
    i32.store
    local.get 0
    local.get 8
    local.get 4
    i32.add
    local.tee 2
    i32.store offset=428
    local.get 0
    local.get 7
    local.get 4
    i32.sub
    local.tee 3
    i32.store offset=420
    local.get 2
    local.get 3
    i32.const 1
    i32.or
    i32.store offset=4
    local.get 1)
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$8memalign17h3ff45824ebb127ccE (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    i32.const 0
    local.set 3
    block  ;; label = @1
      i32.const -65587
      local.get 1
      i32.const 16
      local.get 1
      i32.const 16
      i32.gt_u
      select
      local.tee 1
      i32.sub
      local.get 2
      i32.le_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.const 16
      local.get 2
      i32.const 11
      i32.add
      i32.const -8
      i32.and
      local.get 2
      i32.const 11
      i32.lt_u
      select
      local.tee 4
      i32.add
      i32.const 12
      i32.add
      call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17h0a666368b1102bfeE
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const -8
      i32.add
      local.set 3
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.const -1
          i32.add
          local.tee 5
          local.get 2
          i32.and
          br_if 0 (;@3;)
          local.get 3
          local.set 1
          br 1 (;@2;)
        end
        local.get 2
        i32.const -4
        i32.add
        local.tee 6
        i32.load
        local.tee 7
        i32.const -8
        i32.and
        local.get 5
        local.get 2
        i32.add
        i32.const 0
        local.get 1
        i32.sub
        i32.and
        i32.const -8
        i32.add
        local.tee 2
        i32.const 0
        local.get 1
        local.get 2
        local.get 3
        i32.sub
        i32.const 16
        i32.gt_u
        select
        i32.add
        local.tee 1
        local.get 3
        i32.sub
        local.tee 2
        i32.sub
        local.set 5
        block  ;; label = @3
          local.get 7
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          local.get 5
          local.get 1
          i32.load offset=4
          i32.const 1
          i32.and
          i32.or
          i32.const 2
          i32.or
          i32.store offset=4
          local.get 1
          local.get 5
          i32.add
          local.tee 5
          local.get 5
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 6
          local.get 2
          local.get 6
          i32.load
          i32.const 1
          i32.and
          i32.or
          i32.const 2
          i32.or
          i32.store
          local.get 3
          local.get 2
          i32.add
          local.tee 5
          local.get 5
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          local.get 3
          local.get 2
          call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17hc73bbef596940e15E.llvm.14233881234370288605
          br 1 (;@2;)
        end
        local.get 3
        i32.load
        local.set 3
        local.get 1
        local.get 5
        i32.store offset=4
        local.get 1
        local.get 3
        local.get 2
        i32.add
        i32.store
      end
      block  ;; label = @2
        local.get 1
        i32.load offset=4
        local.tee 2
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.const -8
        i32.and
        local.tee 3
        local.get 4
        i32.const 16
        i32.add
        i32.le_u
        br_if 0 (;@2;)
        local.get 1
        local.get 4
        local.get 2
        i32.const 1
        i32.and
        i32.or
        i32.const 2
        i32.or
        i32.store offset=4
        local.get 1
        local.get 4
        i32.add
        local.tee 2
        local.get 3
        local.get 4
        i32.sub
        local.tee 4
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 1
        local.get 3
        i32.add
        local.tee 3
        local.get 3
        i32.load offset=4
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 0
        local.get 2
        local.get 4
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17hc73bbef596940e15E.llvm.14233881234370288605
      end
      local.get 1
      i32.const 8
      i32.add
      local.set 3
    end
    local.get 3)
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h6e31f183a6d51aa5E (type 1) (param i32 i32)
    local.get 0
    i64.const 9220376746919867076
    i64.store offset=8
    local.get 0
    i64.const 395955473643699580
    i64.store)
  (func $_ZN4core3fmt5Write9write_fmt17hfacdb15f35c6f2c4E (type 2) (param i32 i32) (result i32)
    local.get 0
    i32.const 1052532
    local.get 1
    call $_ZN4core3fmt5write17h55b62ec8489b4effE)
  (func $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h3bceb8e6c5131c36E.1 (type 0) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end)
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17had9e027a1aa3b2ccE.3 (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const 0
            i32.store offset=12
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            block  ;; label = @5
              local.get 1
              i32.const 65536
              i32.ge_u
              br_if 0 (;@5;)
              local.get 2
              local.get 1
              i32.const 12
              i32.shr_u
              i32.const 224
              i32.or
              i32.store8 offset=12
              local.get 2
              local.get 1
              i32.const 6
              i32.shr_u
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=13
              i32.const 3
              local.set 3
              i32.const 2
              local.set 4
              br 3 (;@2;)
            end
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            local.get 2
            local.get 1
            i32.const 18
            i32.shr_u
            i32.const 7
            i32.and
            i32.const 240
            i32.or
            i32.store8 offset=12
            i32.const 4
            local.set 3
            i32.const 3
            local.set 4
            br 2 (;@2;)
          end
          block  ;; label = @4
            local.get 0
            i32.load offset=8
            local.tee 3
            local.get 0
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 0
            local.get 3
            call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17h322ca40853dbe2e1E
            local.get 0
            i32.load offset=8
            local.set 3
          end
          local.get 0
          i32.load offset=4
          local.get 3
          i32.add
          local.get 1
          i32.store8
          local.get 0
          local.get 0
          i32.load offset=8
          i32.const 1
          i32.add
          i32.store offset=8
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 3
        i32.const 1
        local.set 4
      end
      local.get 2
      i32.const 12
      i32.add
      local.get 4
      i32.or
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8
      block  ;; label = @2
        local.get 0
        i32.load
        local.get 0
        i32.load offset=8
        local.tee 1
        i32.sub
        local.get 3
        i32.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        local.get 3
        call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17ha8d8870fa1fd559bE
        local.get 0
        i32.load offset=8
        local.set 1
      end
      local.get 0
      i32.load offset=4
      local.get 1
      i32.add
      local.get 2
      i32.const 12
      i32.add
      local.get 3
      memory.copy
      local.get 0
      local.get 1
      local.get 3
      i32.add
      i32.store offset=8
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    i32.const 0)
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h52d87c11c795cdddE.3 (type 3) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.get 0
      i32.load offset=8
      local.tee 3
      i32.sub
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 2
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17ha8d8870fa1fd559bE
      local.get 0
      i32.load offset=8
      local.set 3
    end
    local.get 0
    i32.load offset=4
    local.get 3
    i32.add
    local.get 1
    local.get 2
    memory.copy
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0)
  (func $__rdl_alloc (type 2) (param i32 i32) (result i32)
    loop  ;; label = @1
      i32.const 0
      i32.const 1
      i32.atomic.rmw.xchg offset=1054016
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 9
        i32.lt_u
        br_if 0 (;@2;)
        i32.const 1054020
        local.get 1
        local.get 0
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$8memalign17h3ff45824ebb127ccE
        local.set 1
        br 1 (;@1;)
      end
      i32.const 1054020
      local.get 0
      call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17h0a666368b1102bfeE
      local.set 1
    end
    i32.const 0
    i32.const 0
    i32.atomic.rmw.xchg offset=1054016
    drop
    local.get 1)
  (func $__rdl_dealloc (type 6) (param i32 i32 i32)
    (local i32 i32)
    loop  ;; label = @1
      i32.const 0
      i32.const 1
      i32.atomic.rmw.xchg offset=1054016
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const -4
        i32.add
        i32.load
        local.tee 3
        i32.const -8
        i32.and
        local.tee 4
        i32.const 4
        i32.const 8
        local.get 3
        i32.const 3
        i32.and
        local.tee 3
        select
        local.get 1
        i32.add
        i32.lt_u
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 1
          i32.const 39
          i32.add
          i32.gt_u
          br_if 2 (;@1;)
        end
        i32.const 1054020
        local.get 0
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$4free17hc03c95c3cec481e0E
        i32.const 0
        i32.const 0
        i32.atomic.rmw.xchg offset=1054016
        drop
        return
      end
      i32.const 1052406
      i32.const 46
      i32.const 1052452
      call $_ZN4core9panicking5panic17h5183d2125e960738E
      unreachable
    end
    i32.const 1052468
    i32.const 46
    i32.const 1052516
    call $_ZN4core9panicking5panic17h5183d2125e960738E
    unreachable)
  (func $__rdl_realloc (type 8) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    loop  ;; label = @1
      i32.const 0
      i32.const 1
      i32.atomic.rmw.xchg offset=1054016
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.const -4
            i32.add
            local.tee 4
            i32.load
            local.tee 5
            i32.const -8
            i32.and
            local.tee 6
            i32.const 4
            i32.const 8
            local.get 5
            i32.const 3
            i32.and
            local.tee 5
            select
            local.get 1
            i32.add
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 39
            i32.add
            local.set 7
            block  ;; label = @5
              local.get 5
              i32.eqz
              br_if 0 (;@5;)
              local.get 6
              local.get 7
              i32.gt_u
              br_if 2 (;@3;)
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 2
                  i32.const 9
                  i32.lt_u
                  br_if 0 (;@7;)
                  i32.const 1054020
                  local.get 2
                  local.get 3
                  call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$8memalign17h3ff45824ebb127ccE
                  local.tee 2
                  br_if 1 (;@6;)
                  i32.const 0
                  local.set 2
                  br 2 (;@5;)
                end
                i32.const 1054020
                local.get 0
                local.get 3
                call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$7realloc17hb891c38c98b4199eE
                local.set 2
                br 1 (;@5;)
              end
              local.get 2
              local.get 0
              local.get 1
              local.get 3
              local.get 1
              local.get 3
              i32.lt_u
              select
              memory.copy
              local.get 4
              i32.load
              local.tee 3
              i32.const -8
              i32.and
              local.tee 5
              i32.const 4
              i32.const 8
              local.get 3
              i32.const 3
              i32.and
              local.tee 3
              select
              local.get 1
              i32.add
              i32.lt_u
              br_if 3 (;@2;)
              block  ;; label = @6
                local.get 3
                i32.eqz
                br_if 0 (;@6;)
                local.get 5
                local.get 7
                i32.gt_u
                br_if 5 (;@1;)
              end
              i32.const 1054020
              local.get 0
              call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$4free17hc03c95c3cec481e0E
            end
            i32.const 0
            i32.const 0
            i32.atomic.rmw.xchg offset=1054016
            drop
            local.get 2
            return
          end
          i32.const 1052406
          i32.const 46
          i32.const 1052452
          call $_ZN4core9panicking5panic17h5183d2125e960738E
          unreachable
        end
        i32.const 1052468
        i32.const 46
        i32.const 1052516
        call $_ZN4core9panicking5panic17h5183d2125e960738E
        unreachable
      end
      i32.const 1052406
      i32.const 46
      i32.const 1052452
      call $_ZN4core9panicking5panic17h5183d2125e960738E
      unreachable
    end
    i32.const 1052468
    i32.const 46
    i32.const 1052516
    call $_ZN4core9panicking5panic17h5183d2125e960738E
    unreachable)
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17ha7f99a7273f54626E (type 1) (param i32 i32)
    local.get 0
    i64.const -5918158352840079641
    i64.store offset=8
    local.get 0
    i64.const 439319701636951332
    i64.store)
  (func $_ZN5alloc7raw_vec11finish_grow17hb321f6aada7cc474E.llvm.8415571176415214293 (type 7) (param i32 i32 i32 i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          i32.const 0
          i32.lt_s
          br_if 1 (;@2;)
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.load offset=4
                i32.eqz
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 3
                  i32.load offset=8
                  local.tee 4
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 2
                    br_if 0 (;@8;)
                    local.get 1
                    local.set 3
                    br 4 (;@4;)
                  end
                  i32.const 0
                  i32.load8_u offset=1053953
                  drop
                  br 2 (;@5;)
                end
                local.get 3
                i32.load
                local.get 4
                local.get 1
                local.get 2
                call $__rust_realloc
                local.set 3
                br 2 (;@4;)
              end
              block  ;; label = @6
                local.get 2
                br_if 0 (;@6;)
                local.get 1
                local.set 3
                br 2 (;@4;)
              end
              i32.const 0
              i32.load8_u offset=1053953
              drop
            end
            local.get 2
            local.get 1
            call $__rust_alloc
            local.set 3
          end
          block  ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.get 2
            i32.store offset=8
            local.get 0
            local.get 3
            i32.store offset=4
            local.get 0
            i32.const 0
            i32.store
            return
          end
          local.get 0
          local.get 2
          i32.store offset=8
          local.get 0
          local.get 1
          i32.store offset=4
          br 2 (;@1;)
        end
        local.get 0
        i32.const 0
        i32.store offset=4
        br 1 (;@1;)
      end
      local.get 0
      i32.const 0
      i32.store offset=4
    end
    local.get 0
    i32.const 1
    i32.store)
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17h322ca40853dbe2e1E (type 1) (param i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load
      local.tee 3
      i32.const 1
      i32.shl
      local.tee 4
      local.get 1
      local.get 4
      local.get 1
      i32.gt_u
      select
      local.tee 1
      i32.const 8
      local.get 1
      i32.const 8
      i32.gt_u
      select
      local.tee 1
      i32.const -1
      i32.xor
      i32.const 31
      i32.shr_u
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          i32.const 0
          local.set 3
          br 1 (;@2;)
        end
        local.get 2
        local.get 3
        i32.store offset=28
        local.get 2
        local.get 0
        i32.load offset=4
        i32.store offset=20
        i32.const 1
        local.set 3
      end
      local.get 2
      local.get 3
      i32.store offset=24
      local.get 2
      i32.const 8
      i32.add
      local.get 4
      local.get 1
      local.get 2
      i32.const 20
      i32.add
      call $_ZN5alloc7raw_vec11finish_grow17hb321f6aada7cc474E.llvm.8415571176415214293
      block  ;; label = @2
        local.get 2
        i32.load offset=8
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.load offset=12
        local.tee 0
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 2
        i32.load offset=16
        call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
        unreachable
      end
      local.get 2
      i32.load offset=12
      local.set 3
      local.get 0
      local.get 1
      i32.store
      local.get 0
      local.get 3
      i32.store offset=4
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    call $_ZN5alloc7raw_vec17capacity_overflow17h45f3b19af45ec27bE
    unreachable)
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17ha8d8870fa1fd559bE (type 6) (param i32 i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      local.get 2
      i32.add
      local.tee 2
      local.get 1
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 1
      local.set 4
      local.get 0
      i32.load
      local.tee 5
      i32.const 1
      i32.shl
      local.tee 1
      local.get 2
      local.get 1
      local.get 2
      i32.gt_u
      select
      local.tee 1
      i32.const 8
      local.get 1
      i32.const 8
      i32.gt_u
      select
      local.tee 1
      i32.const -1
      i32.xor
      i32.const 31
      i32.shr_u
      local.set 2
      block  ;; label = @2
        block  ;; label = @3
          local.get 5
          br_if 0 (;@3;)
          i32.const 0
          local.set 4
          br 1 (;@2;)
        end
        local.get 3
        local.get 5
        i32.store offset=28
        local.get 3
        local.get 0
        i32.load offset=4
        i32.store offset=20
      end
      local.get 3
      local.get 4
      i32.store offset=24
      local.get 3
      i32.const 8
      i32.add
      local.get 2
      local.get 1
      local.get 3
      i32.const 20
      i32.add
      call $_ZN5alloc7raw_vec11finish_grow17hb321f6aada7cc474E.llvm.8415571176415214293
      block  ;; label = @2
        local.get 3
        i32.load offset=8
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        i32.load offset=12
        local.tee 0
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 3
        i32.load offset=16
        call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
        unreachable
      end
      local.get 3
      i32.load offset=12
      local.set 2
      local.get 0
      local.get 1
      i32.store
      local.get 0
      local.get 2
      i32.store offset=4
      local.get 3
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    call $_ZN5alloc7raw_vec17capacity_overflow17h45f3b19af45ec27bE
    unreachable)
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h523f35a5a41ea52fE (type 1) (param i32 i32)
    local.get 0
    i64.const -4493808902380553279
    i64.store offset=8
    local.get 0
    i64.const -163230743173927068
    i64.store)
  (func $_ZN4core3ptr28drop_in_place$LT$$RF$str$GT$17h800211bd58f2cc07E.1 (type 0) (param i32))
  (func $_ZN4core3ptr77drop_in_place$LT$std..panicking..begin_panic_handler..FormatStringPayload$GT$17ha4b1fec6326a7cf9E (type 0) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.const -2147483648
      i32.eq
      br_if 0 (;@1;)
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end)
  (func $_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h272dc83cd57b5547E (type 0) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 0
      i32.load offset=12
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=16
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end
    block  ;; label = @1
      local.get 0
      i32.const -1
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      i32.const 1
      i32.atomic.rmw.sub offset=4
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      atomic.fence
      local.get 0
      i32.const 24
      i32.const 4
      call $__rust_dealloc
    end)
  (func $_ZN3std6thread5sleep17he7bace389a782edbE (type 11) (param i64 i32)
    (local i32 i64 i64)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 8
    i32.add
    local.get 0
    i64.const 0
    i64.const 1000000000
    i64.const 0
    call $__multi3
    block  ;; label = @1
      local.get 2
      i64.load offset=8
      local.tee 3
      local.get 1
      i64.extend_i32_u
      i64.add
      local.tee 0
      local.get 2
      i32.const 16
      i32.add
      i64.load
      local.get 0
      local.get 3
      i64.lt_u
      i64.extend_i32_u
      i64.add
      local.tee 3
      i64.or
      i64.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 2
        i32.const 0
        i32.store offset=28
        local.get 2
        i32.const 0
        local.get 0
        i64.const 9223372036854775807
        local.get 0
        i64.const 9223372036854775807
        i64.lt_u
        select
        i64.const 9223372036854775807
        local.get 3
        i64.eqz
        select
        local.tee 4
        memory.atomic.wait32 offset=28
        drop
        local.get 0
        local.get 4
        i64.lt_u
        local.set 1
        local.get 0
        local.get 4
        i64.sub
        local.tee 4
        local.set 0
        local.get 4
        local.get 3
        local.get 1
        i64.extend_i32_u
        i64.sub
        local.tee 3
        i64.or
        i64.const 0
        i64.ne
        br_if 0 (;@2;)
      end
    end
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN3std10sys_common9backtrace26__rust_end_short_backtrace17hefc9a3e6e4a3ff8aE (type 0) (param i32)
    local.get 0
    call $_ZN3std9panicking19begin_panic_handler28_$u7b$$u7b$closure$u7d$$u7d$17h8b3b504dfd65845cE
    unreachable)
  (func $_ZN3std9panicking19begin_panic_handler28_$u7b$$u7b$closure$u7d$$u7d$17h8b3b504dfd65845cE (type 0) (param i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.tee 2
    i32.load offset=12
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.load offset=4
            br_table 0 (;@4;) 1 (;@3;) 2 (;@2;)
          end
          local.get 3
          br_if 1 (;@2;)
          i32.const 1052576
          local.set 2
          i32.const 0
          local.set 3
          br 2 (;@1;)
        end
        local.get 3
        br_if 0 (;@2;)
        local.get 2
        i32.load
        local.tee 2
        i32.load offset=4
        local.set 3
        local.get 2
        i32.load
        local.set 2
        br 1 (;@1;)
      end
      local.get 1
      local.get 2
      i32.store offset=12
      local.get 1
      i32.const -2147483648
      i32.store
      local.get 1
      i32.const 1052612
      local.get 0
      i32.load offset=4
      local.tee 2
      i32.load offset=8
      local.get 0
      i32.load offset=8
      local.get 2
      i32.load8_u offset=16
      local.get 2
      i32.load8_u offset=17
      call $_ZN3std9panicking20rust_panic_with_hook17h5d938c6f2f6345baE
      unreachable
    end
    local.get 1
    local.get 3
    i32.store offset=4
    local.get 1
    local.get 2
    i32.store
    local.get 1
    i32.const 1052592
    local.get 0
    i32.load offset=4
    local.tee 2
    i32.load offset=8
    local.get 0
    i32.load offset=8
    local.get 2
    i32.load8_u offset=16
    local.get 2
    i32.load8_u offset=17
    call $_ZN3std9panicking20rust_panic_with_hook17h5d938c6f2f6345baE
    unreachable)
  (func $_ZN3std9panicking11panic_count17is_zero_slow_path17h69ec01d9f0b5341bE (type 4) (result i32)
    global.get $__tls_base
    i32.const 16
    i32.add
    i32.load
    i32.eqz)
  (func $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17h2d0fadd3ac8bb5afE (type 1) (param i32 i32)
    local.get 0
    i32.const 1052576
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store)
  (func $_ZN3std9panicking11panic_count17LOCAL_PANIC_COUNT7__getit17h1f4f26428983601aE.llvm.9857674224645661670 (type 10) (param i32) (result i32)
    global.get $__tls_base
    i32.const 16
    i32.add)
  (func $__rust_start_panic (type 2) (param i32 i32) (result i32)
    unreachable
    unreachable)
  (func $_ZN61_$LT$dlmalloc..sys..System$u20$as$u20$dlmalloc..Allocator$GT$5alloc17h293f24278785f002E (type 6) (param i32 i32 i32)
    (local i32)
    local.get 2
    i32.const 16
    i32.shr_u
    memory.grow
    local.set 3
    local.get 0
    i32.const 0
    i32.store offset=8
    local.get 0
    i32.const 0
    local.get 2
    i32.const -65536
    i32.and
    local.get 3
    i32.const -1
    i32.eq
    local.tee 2
    select
    i32.store offset=4
    local.get 0
    i32.const 0
    local.get 3
    i32.const 16
    i32.shl
    local.get 2
    select
    i32.store)
  (func $_ZN4core3ptr205drop_in_place$LT$$LT$alloc..boxed..Box$LT$dyn$u20$core..error..Error$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$u20$as$u20$core..convert..From$LT$alloc..string..String$GT$$GT$..from..StringError$GT$17h2008b045d902326fE (type 0) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end)
  (func $_ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17h3fa5012f7cea22daE (type 0) (param i32))
  (func $_ZN53_$LT$core..fmt..Error$u20$as$u20$core..fmt..Debug$GT$3fmt17haf1074f0f9151d42E.1 (type 2) (param i32 i32) (result i32)
    local.get 1
    i32.const 1052632
    i32.const 5
    call $_ZN4core3fmt9Formatter9write_str17h1fe892ce632ffc37E)
  (func $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E (type 1) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 1
                i32.load offset=4
                local.tee 3
                i32.eqz
                br_if 0 (;@6;)
                local.get 1
                i32.load
                local.set 4
                local.get 3
                i32.const 3
                i32.and
                local.set 5
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 3
                    i32.const 4
                    i32.ge_u
                    br_if 0 (;@8;)
                    i32.const 0
                    local.set 3
                    i32.const 0
                    local.set 6
                    br 1 (;@7;)
                  end
                  local.get 4
                  i32.const 28
                  i32.add
                  local.set 7
                  local.get 3
                  i32.const -4
                  i32.and
                  local.set 8
                  i32.const 0
                  local.set 3
                  i32.const 0
                  local.set 6
                  loop  ;; label = @8
                    local.get 7
                    i32.load
                    local.get 7
                    i32.const -8
                    i32.add
                    i32.load
                    local.get 7
                    i32.const -16
                    i32.add
                    i32.load
                    local.get 7
                    i32.const -24
                    i32.add
                    i32.load
                    local.get 3
                    i32.add
                    i32.add
                    i32.add
                    i32.add
                    local.set 3
                    local.get 7
                    i32.const 32
                    i32.add
                    local.set 7
                    local.get 8
                    local.get 6
                    i32.const 4
                    i32.add
                    local.tee 6
                    i32.ne
                    br_if 0 (;@8;)
                  end
                end
                block  ;; label = @7
                  local.get 5
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 6
                  i32.const 3
                  i32.shl
                  local.get 4
                  i32.add
                  i32.const 4
                  i32.add
                  local.set 7
                  loop  ;; label = @8
                    local.get 7
                    i32.load
                    local.get 3
                    i32.add
                    local.set 3
                    local.get 7
                    i32.const 8
                    i32.add
                    local.set 7
                    local.get 5
                    i32.const -1
                    i32.add
                    local.tee 5
                    br_if 0 (;@8;)
                  end
                end
                block  ;; label = @7
                  local.get 1
                  i32.load offset=12
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 3
                  i32.const 0
                  i32.lt_s
                  br_if 1 (;@6;)
                  local.get 3
                  i32.const 16
                  i32.lt_u
                  local.get 4
                  i32.load offset=4
                  i32.eqz
                  i32.and
                  br_if 1 (;@6;)
                  local.get 3
                  i32.const 1
                  i32.shl
                  local.set 3
                end
                local.get 3
                br_if 1 (;@5;)
              end
              i32.const 1
              local.set 7
              i32.const 0
              local.set 3
              br 1 (;@4;)
            end
            local.get 3
            i32.const 0
            i32.lt_s
            br_if 1 (;@3;)
            i32.const 0
            i32.load8_u offset=1053953
            drop
            local.get 3
            i32.const 1
            call $__rust_alloc
            local.tee 7
            i32.eqz
            br_if 2 (;@2;)
          end
          local.get 2
          i32.const 0
          i32.store offset=8
          local.get 2
          local.get 7
          i32.store offset=4
          local.get 2
          local.get 3
          i32.store
          local.get 2
          i32.const 1052640
          local.get 1
          call $_ZN4core3fmt5write17h55b62ec8489b4effE
          i32.eqz
          br_if 2 (;@1;)
          i32.const 1052664
          i32.const 51
          local.get 2
          i32.const 15
          i32.add
          i32.const 1052716
          i32.const 1052852
          call $_ZN4core6result13unwrap_failed17ha1a4a677361ebda3E
          unreachable
        end
        call $_ZN5alloc7raw_vec17capacity_overflow17h45f3b19af45ec27bE
        unreachable
      end
      i32.const 1
      local.get 3
      call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
      unreachable
    end
    local.get 0
    local.get 2
    i64.load align=4
    i64.store align=4
    local.get 0
    i32.const 8
    i32.add
    local.get 2
    i32.const 8
    i32.add
    i32.load
    i32.store
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h52d87c11c795cdddE.4 (type 3) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.get 0
      i32.load offset=8
      local.tee 3
      i32.sub
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 2
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h5441694fa6a8dc4fE
      local.get 0
      i32.load offset=8
      local.set 3
    end
    local.get 0
    i32.load offset=4
    local.get 3
    i32.add
    local.get 1
    local.get 2
    memory.copy
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0)
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17had9e027a1aa3b2ccE.4 (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const 0
            i32.store offset=12
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            block  ;; label = @5
              local.get 1
              i32.const 65536
              i32.ge_u
              br_if 0 (;@5;)
              local.get 2
              local.get 1
              i32.const 12
              i32.shr_u
              i32.const 224
              i32.or
              i32.store8 offset=12
              local.get 2
              local.get 1
              i32.const 6
              i32.shr_u
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=13
              i32.const 3
              local.set 3
              i32.const 2
              local.set 4
              br 3 (;@2;)
            end
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            local.get 2
            local.get 1
            i32.const 18
            i32.shr_u
            i32.const 7
            i32.and
            i32.const 240
            i32.or
            i32.store8 offset=12
            i32.const 4
            local.set 3
            i32.const 3
            local.set 4
            br 2 (;@2;)
          end
          block  ;; label = @4
            local.get 0
            i32.load offset=8
            local.tee 3
            local.get 0
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 0
            local.get 3
            call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17hcafd0896ec389d28E
            local.get 0
            i32.load offset=8
            local.set 3
          end
          local.get 0
          i32.load offset=4
          local.get 3
          i32.add
          local.get 1
          i32.store8
          local.get 0
          local.get 0
          i32.load offset=8
          i32.const 1
          i32.add
          i32.store offset=8
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 3
        i32.const 1
        local.set 4
      end
      local.get 2
      i32.const 12
      i32.add
      local.get 4
      i32.or
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8
      block  ;; label = @2
        local.get 0
        i32.load
        local.get 0
        i32.load offset=8
        local.tee 1
        i32.sub
        local.get 3
        i32.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        local.get 3
        call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h5441694fa6a8dc4fE
        local.get 0
        i32.load offset=8
        local.set 1
      end
      local.get 0
      i32.load offset=4
      local.get 1
      i32.add
      local.get 2
      i32.const 12
      i32.add
      local.get 3
      memory.copy
      local.get 0
      local.get 1
      local.get 3
      i32.add
      i32.store offset=8
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    i32.const 0)
  (func $_ZN4core3fmt5Write9write_fmt17hed59aef0e547cad5E (type 2) (param i32 i32) (result i32)
    local.get 0
    i32.const 1052868
    local.get 1
    call $_ZN4core3fmt5write17h55b62ec8489b4effE)
  (func $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h347df457801b2e1fE (type 0) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end)
  (func $_ZN5alloc6string6String15from_utf8_lossy17h847cec55033f5fe5E (type 6) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 2
    i32.store offset=8
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    i32.const 32
    i32.add
    local.get 3
    i32.const 4
    i32.add
    call $_ZN87_$LT$core..str..lossy..Utf8Chunks$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hda991ca6d6612cbfE
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.load offset=32
          local.tee 4
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          i32.const 1052868
          local.set 4
          br 1 (;@2;)
        end
        local.get 3
        i32.load offset=36
        local.set 1
        local.get 3
        i32.load offset=44
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                br_if 0 (;@6;)
                i32.const 1
                local.set 5
                br 1 (;@5;)
              end
              local.get 2
              i32.const 0
              i32.lt_s
              br_if 1 (;@4;)
              i32.const 0
              i32.load8_u offset=1053953
              drop
              local.get 2
              i32.const 1
              call $__rust_alloc
              local.tee 5
              i32.eqz
              br_if 2 (;@3;)
            end
            i32.const 0
            local.set 6
            local.get 3
            i32.const 0
            i32.store offset=20
            local.get 3
            local.get 5
            i32.store offset=16
            local.get 3
            local.get 2
            i32.store offset=12
            block  ;; label = @5
              local.get 1
              local.get 2
              i32.le_u
              br_if 0 (;@5;)
              local.get 3
              i32.const 12
              i32.add
              i32.const 0
              local.get 1
              call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h5441694fa6a8dc4fE
              local.get 3
              i32.load offset=12
              local.set 2
              local.get 3
              i32.load offset=16
              local.set 5
              local.get 3
              i32.load offset=20
              local.set 6
            end
            local.get 5
            local.get 6
            i32.add
            local.get 4
            local.get 1
            memory.copy
            local.get 3
            local.get 6
            local.get 1
            i32.add
            local.tee 1
            i32.store offset=20
            block  ;; label = @5
              local.get 2
              local.get 1
              i32.sub
              i32.const 2
              i32.gt_u
              br_if 0 (;@5;)
              local.get 3
              i32.const 12
              i32.add
              local.get 1
              i32.const 3
              call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h5441694fa6a8dc4fE
              local.get 3
              i32.load offset=16
              local.set 5
              local.get 3
              i32.load offset=20
              local.set 1
            end
            local.get 5
            local.get 1
            i32.add
            local.tee 2
            i32.const 0
            i32.load16_u offset=1052892 align=1
            local.tee 7
            i32.store16 align=1
            local.get 2
            i32.const 2
            i32.add
            i32.const 0
            i32.load8_u offset=1052894
            local.tee 8
            i32.store8
            local.get 3
            local.get 1
            i32.const 3
            i32.add
            local.tee 2
            i32.store offset=20
            local.get 3
            local.get 3
            i64.load offset=4 align=4
            i64.store offset=24 align=4
            local.get 3
            i32.const 32
            i32.add
            local.get 3
            i32.const 24
            i32.add
            call $_ZN87_$LT$core..str..lossy..Utf8Chunks$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hda991ca6d6612cbfE
            block  ;; label = @5
              local.get 3
              i32.load offset=32
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              loop  ;; label = @6
                local.get 3
                i32.load offset=44
                local.set 5
                block  ;; label = @7
                  local.get 3
                  i32.load offset=12
                  local.get 2
                  i32.sub
                  local.get 3
                  i32.load offset=36
                  local.tee 1
                  i32.ge_u
                  br_if 0 (;@7;)
                  local.get 3
                  i32.const 12
                  i32.add
                  local.get 2
                  local.get 1
                  call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h5441694fa6a8dc4fE
                  local.get 3
                  i32.load offset=20
                  local.set 2
                end
                local.get 3
                i32.load offset=16
                local.tee 6
                local.get 2
                i32.add
                local.get 4
                local.get 1
                memory.copy
                local.get 3
                local.get 2
                local.get 1
                i32.add
                local.tee 2
                i32.store offset=20
                block  ;; label = @7
                  local.get 5
                  i32.eqz
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 3
                    i32.load offset=12
                    local.get 2
                    i32.sub
                    i32.const 2
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 3
                    i32.const 12
                    i32.add
                    local.get 2
                    i32.const 3
                    call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h5441694fa6a8dc4fE
                    local.get 3
                    i32.load offset=16
                    local.set 6
                    local.get 3
                    i32.load offset=20
                    local.set 2
                  end
                  local.get 6
                  local.get 2
                  i32.add
                  local.tee 1
                  local.get 7
                  i32.store16 align=1
                  local.get 1
                  i32.const 2
                  i32.add
                  local.get 8
                  i32.store8
                  local.get 3
                  local.get 2
                  i32.const 3
                  i32.add
                  local.tee 2
                  i32.store offset=20
                end
                local.get 3
                i32.const 32
                i32.add
                local.get 3
                i32.const 24
                i32.add
                call $_ZN87_$LT$core..str..lossy..Utf8Chunks$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hda991ca6d6612cbfE
                local.get 3
                i32.load offset=32
                local.tee 4
                br_if 0 (;@6;)
              end
            end
            local.get 0
            local.get 3
            i64.load offset=12 align=4
            i64.store align=4
            local.get 0
            i32.const 8
            i32.add
            local.get 3
            i32.const 12
            i32.add
            i32.const 8
            i32.add
            i32.load
            i32.store
            br 3 (;@1;)
          end
          call $_ZN5alloc7raw_vec17capacity_overflow17h45f3b19af45ec27bE
          unreachable
        end
        i32.const 1
        local.get 2
        call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
        unreachable
      end
      local.get 0
      local.get 1
      i32.store offset=8
      local.get 0
      local.get 4
      i32.store offset=4
      local.get 0
      i32.const -2147483648
      i32.store
    end
    local.get 3
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $_ZN60_$LT$alloc..string..String$u20$as$u20$core..clone..Clone$GT$5clone17h6b93b50df1762922E (type 1) (param i32 i32)
    (local i32 i32)
    local.get 1
    i32.load offset=4
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load offset=8
            local.tee 1
            br_if 0 (;@4;)
            i32.const 1
            local.set 3
            br 1 (;@3;)
          end
          local.get 1
          i32.const 0
          i32.lt_s
          br_if 1 (;@2;)
          i32.const 0
          i32.load8_u offset=1053953
          drop
          local.get 1
          i32.const 1
          call $__rust_alloc
          local.tee 3
          i32.eqz
          br_if 2 (;@1;)
        end
        local.get 3
        local.get 2
        local.get 1
        memory.copy
        local.get 0
        local.get 1
        i32.store offset=8
        local.get 0
        local.get 3
        i32.store offset=4
        local.get 0
        local.get 1
        i32.store
        return
      end
      call $_ZN5alloc7raw_vec17capacity_overflow17h45f3b19af45ec27bE
      unreachable
    end
    i32.const 1
    local.get 1
    call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
    unreachable)
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h52d87c11c795cdddE.5 (type 3) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.get 0
      i32.load offset=8
      local.tee 3
      i32.sub
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 2
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h5441694fa6a8dc4fE
      local.get 0
      i32.load offset=8
      local.set 3
    end
    local.get 0
    i32.load offset=4
    local.get 3
    i32.add
    local.get 1
    local.get 2
    memory.copy
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0)
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17had9e027a1aa3b2ccE.5 (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const 0
            i32.store offset=12
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            block  ;; label = @5
              local.get 1
              i32.const 65536
              i32.ge_u
              br_if 0 (;@5;)
              local.get 2
              local.get 1
              i32.const 12
              i32.shr_u
              i32.const 224
              i32.or
              i32.store8 offset=12
              local.get 2
              local.get 1
              i32.const 6
              i32.shr_u
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=13
              i32.const 3
              local.set 3
              i32.const 2
              local.set 4
              br 3 (;@2;)
            end
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            local.get 2
            local.get 1
            i32.const 18
            i32.shr_u
            i32.const 7
            i32.and
            i32.const 240
            i32.or
            i32.store8 offset=12
            i32.const 4
            local.set 3
            i32.const 3
            local.set 4
            br 2 (;@2;)
          end
          block  ;; label = @4
            local.get 0
            i32.load offset=8
            local.tee 3
            local.get 0
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 0
            local.get 3
            call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17hcafd0896ec389d28E
            local.get 0
            i32.load offset=8
            local.set 3
          end
          local.get 0
          i32.load offset=4
          local.get 3
          i32.add
          local.get 1
          i32.store8
          local.get 0
          local.get 0
          i32.load offset=8
          i32.const 1
          i32.add
          i32.store offset=8
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 3
        i32.const 1
        local.set 4
      end
      local.get 2
      i32.const 12
      i32.add
      local.get 4
      i32.or
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8
      block  ;; label = @2
        local.get 0
        i32.load
        local.get 0
        i32.load offset=8
        local.tee 1
        i32.sub
        local.get 3
        i32.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        local.get 3
        call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h5441694fa6a8dc4fE
        local.get 0
        i32.load offset=8
        local.set 1
      end
      local.get 0
      i32.load offset=4
      local.get 1
      i32.add
      local.get 2
      i32.const 12
      i32.add
      local.get 3
      memory.copy
      local.get 0
      local.get 1
      local.get 3
      i32.add
      i32.store offset=8
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    i32.const 0)
  (func $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E (type 1) (param i32 i32)
    local.get 1
    local.get 0
    call $__rust_alloc_error_handler
    unreachable)
  (func $_ZN5alloc7raw_vec17capacity_overflow17h45f3b19af45ec27bE (type 5)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    local.get 0
    i32.const 1
    i32.store offset=12
    local.get 0
    i32.const 1052916
    i32.store offset=8
    local.get 0
    i64.const 0
    i64.store offset=20 align=4
    local.get 0
    i32.const 1052896
    i32.store offset=16
    local.get 0
    i32.const 8
    i32.add
    i32.const 1053048
    call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
    unreachable)
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h5441694fa6a8dc4fE (type 6) (param i32 i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      local.get 2
      i32.add
      local.tee 2
      local.get 1
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 1
      local.set 4
      local.get 0
      i32.load
      local.tee 5
      i32.const 1
      i32.shl
      local.tee 1
      local.get 2
      local.get 1
      local.get 2
      i32.gt_u
      select
      local.tee 1
      i32.const 8
      local.get 1
      i32.const 8
      i32.gt_u
      select
      local.tee 1
      i32.const -1
      i32.xor
      i32.const 31
      i32.shr_u
      local.set 2
      block  ;; label = @2
        block  ;; label = @3
          local.get 5
          br_if 0 (;@3;)
          i32.const 0
          local.set 4
          br 1 (;@2;)
        end
        local.get 3
        local.get 5
        i32.store offset=28
        local.get 3
        local.get 0
        i32.load offset=4
        i32.store offset=20
      end
      local.get 3
      local.get 4
      i32.store offset=24
      local.get 3
      i32.const 8
      i32.add
      local.get 2
      local.get 1
      local.get 3
      i32.const 20
      i32.add
      call $_ZN5alloc7raw_vec11finish_grow17h75a37a1d50972659E.llvm.15781162937458493533
      block  ;; label = @2
        local.get 3
        i32.load offset=8
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        i32.load offset=12
        local.tee 0
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 3
        i32.load offset=16
        call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
        unreachable
      end
      local.get 3
      i32.load offset=12
      local.set 2
      local.get 0
      local.get 1
      i32.store
      local.get 0
      local.get 2
      i32.store offset=4
      local.get 3
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    call $_ZN5alloc7raw_vec17capacity_overflow17h45f3b19af45ec27bE
    unreachable)
  (func $_ZN5alloc7raw_vec11finish_grow17h75a37a1d50972659E.llvm.15781162937458493533 (type 7) (param i32 i32 i32 i32)
    (local i32 i32 i32)
    i32.const 1
    local.set 4
    i32.const 0
    local.set 5
    i32.const 4
    local.set 6
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.load offset=4
                i32.eqz
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 3
                  i32.load offset=8
                  local.tee 4
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 2
                    br_if 0 (;@8;)
                    i32.const 1
                    local.set 4
                    br 4 (;@4;)
                  end
                  i32.const 0
                  i32.load8_u offset=1053953
                  drop
                  local.get 2
                  i32.const 1
                  call $__rust_alloc
                  local.set 4
                  br 2 (;@5;)
                end
                local.get 3
                i32.load
                local.get 4
                i32.const 1
                local.get 2
                call $__rust_realloc
                local.set 4
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 2
                br_if 0 (;@6;)
                i32.const 1
                local.set 4
                br 2 (;@4;)
              end
              i32.const 0
              i32.load8_u offset=1053953
              drop
              local.get 2
              i32.const 1
              call $__rust_alloc
              local.set 4
            end
            local.get 4
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 0
          local.get 4
          i32.store offset=4
          i32.const 0
          local.set 4
          br 1 (;@2;)
        end
        i32.const 1
        local.set 4
        local.get 0
        i32.const 1
        i32.store offset=4
      end
      i32.const 8
      local.set 6
      local.get 2
      local.set 5
    end
    local.get 0
    local.get 6
    i32.add
    local.get 5
    i32.store
    local.get 0
    local.get 4
    i32.store)
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17hcafd0896ec389d28E (type 1) (param i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load
      local.tee 3
      i32.const 1
      i32.shl
      local.tee 4
      local.get 1
      local.get 4
      local.get 1
      i32.gt_u
      select
      local.tee 1
      i32.const 8
      local.get 1
      i32.const 8
      i32.gt_u
      select
      local.tee 1
      i32.const -1
      i32.xor
      i32.const 31
      i32.shr_u
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          i32.const 0
          local.set 3
          br 1 (;@2;)
        end
        local.get 2
        local.get 3
        i32.store offset=28
        local.get 2
        local.get 0
        i32.load offset=4
        i32.store offset=20
        i32.const 1
        local.set 3
      end
      local.get 2
      local.get 3
      i32.store offset=24
      local.get 2
      i32.const 8
      i32.add
      local.get 4
      local.get 1
      local.get 2
      i32.const 20
      i32.add
      call $_ZN5alloc7raw_vec11finish_grow17h75a37a1d50972659E.llvm.15781162937458493533
      block  ;; label = @2
        local.get 2
        i32.load offset=8
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.load offset=12
        local.tee 0
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 2
        i32.load offset=16
        call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
        unreachable
      end
      local.get 2
      i32.load offset=12
      local.set 3
      local.get 0
      local.get 1
      i32.store
      local.get 0
      local.get 3
      i32.store offset=4
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    call $_ZN5alloc7raw_vec17capacity_overflow17h45f3b19af45ec27bE
    unreachable)
  (func $_ZN4core3fmt5write17h55b62ec8489b4effE (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 3
    i32.store8 offset=44
    local.get 3
    i32.const 32
    i32.store offset=28
    i32.const 0
    local.set 4
    local.get 3
    i32.const 0
    i32.store offset=40
    local.get 3
    local.get 1
    i32.store offset=36
    local.get 3
    local.get 0
    i32.store offset=32
    local.get 3
    i32.const 0
    i32.store offset=20
    local.get 3
    i32.const 0
    i32.store offset=12
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.load offset=16
              local.tee 5
              br_if 0 (;@5;)
              local.get 2
              i32.load offset=12
              local.tee 0
              i32.eqz
              br_if 1 (;@4;)
              local.get 2
              i32.load offset=8
              local.set 1
              local.get 0
              i32.const 3
              i32.shl
              local.set 6
              local.get 0
              i32.const -1
              i32.add
              i32.const 536870911
              i32.and
              i32.const 1
              i32.add
              local.set 4
              local.get 2
              i32.load
              local.set 0
              loop  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  i32.const 4
                  i32.add
                  i32.load
                  local.tee 7
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 3
                  i32.load offset=32
                  local.get 0
                  i32.load
                  local.get 7
                  local.get 3
                  i32.load offset=36
                  i32.load offset=12
                  call_indirect (type 3)
                  br_if 4 (;@3;)
                end
                local.get 1
                i32.load
                local.get 3
                i32.const 12
                i32.add
                local.get 1
                i32.load offset=4
                call_indirect (type 2)
                br_if 3 (;@3;)
                local.get 1
                i32.const 8
                i32.add
                local.set 1
                local.get 0
                i32.const 8
                i32.add
                local.set 0
                local.get 6
                i32.const -8
                i32.add
                local.tee 6
                br_if 0 (;@6;)
                br 2 (;@4;)
              end
            end
            local.get 2
            i32.load offset=20
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.const 5
            i32.shl
            local.set 8
            local.get 1
            i32.const -1
            i32.add
            i32.const 134217727
            i32.and
            i32.const 1
            i32.add
            local.set 4
            local.get 2
            i32.load offset=8
            local.set 9
            local.get 2
            i32.load
            local.set 0
            i32.const 0
            local.set 6
            loop  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.const 4
                i32.add
                i32.load
                local.tee 1
                i32.eqz
                br_if 0 (;@6;)
                local.get 3
                i32.load offset=32
                local.get 0
                i32.load
                local.get 1
                local.get 3
                i32.load offset=36
                i32.load offset=12
                call_indirect (type 3)
                br_if 3 (;@3;)
              end
              local.get 3
              local.get 5
              local.get 6
              i32.add
              local.tee 1
              i32.const 16
              i32.add
              i32.load
              i32.store offset=28
              local.get 3
              local.get 1
              i32.const 28
              i32.add
              i32.load8_u
              i32.store8 offset=44
              local.get 3
              local.get 1
              i32.const 24
              i32.add
              i32.load
              i32.store offset=40
              local.get 1
              i32.const 12
              i32.add
              i32.load
              local.set 7
              i32.const 0
              local.set 10
              i32.const 0
              local.set 11
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 1
                    i32.const 8
                    i32.add
                    i32.load
                    br_table 1 (;@7;) 0 (;@8;) 2 (;@6;) 1 (;@7;)
                  end
                  local.get 7
                  i32.const 3
                  i32.shl
                  local.set 12
                  i32.const 0
                  local.set 11
                  local.get 9
                  local.get 12
                  i32.add
                  local.tee 12
                  i32.load offset=4
                  i32.const 57
                  i32.ne
                  br_if 1 (;@6;)
                  local.get 12
                  i32.load
                  i32.load
                  local.set 7
                end
                i32.const 1
                local.set 11
              end
              local.get 3
              local.get 7
              i32.store offset=16
              local.get 3
              local.get 11
              i32.store offset=12
              local.get 1
              i32.const 4
              i32.add
              i32.load
              local.set 7
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 1
                    i32.load
                    br_table 1 (;@7;) 0 (;@8;) 2 (;@6;) 1 (;@7;)
                  end
                  local.get 7
                  i32.const 3
                  i32.shl
                  local.set 11
                  local.get 9
                  local.get 11
                  i32.add
                  local.tee 11
                  i32.load offset=4
                  i32.const 57
                  i32.ne
                  br_if 1 (;@6;)
                  local.get 11
                  i32.load
                  i32.load
                  local.set 7
                end
                i32.const 1
                local.set 10
              end
              local.get 3
              local.get 7
              i32.store offset=24
              local.get 3
              local.get 10
              i32.store offset=20
              local.get 9
              local.get 1
              i32.const 20
              i32.add
              i32.load
              i32.const 3
              i32.shl
              i32.add
              local.tee 1
              i32.load
              local.get 3
              i32.const 12
              i32.add
              local.get 1
              i32.load offset=4
              call_indirect (type 2)
              br_if 2 (;@3;)
              local.get 0
              i32.const 8
              i32.add
              local.set 0
              local.get 8
              local.get 6
              i32.const 32
              i32.add
              local.tee 6
              i32.ne
              br_if 0 (;@5;)
            end
          end
          local.get 4
          local.get 2
          i32.load offset=4
          i32.ge_u
          br_if 1 (;@2;)
          local.get 3
          i32.load offset=32
          local.get 2
          i32.load
          local.get 4
          i32.const 3
          i32.shl
          i32.add
          local.tee 1
          i32.load
          local.get 1
          i32.load offset=4
          local.get 3
          i32.load offset=36
          i32.load offset=12
          call_indirect (type 3)
          i32.eqz
          br_if 1 (;@2;)
        end
        i32.const 1
        local.set 1
        br 1 (;@1;)
      end
      i32.const 0
      local.set 1
    end
    local.get 3
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $_ZN4core3fmt9Formatter12pad_integral17h0f3b9f3b71d03c2bE (type 12) (param i32 i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        local.get 5
        i32.const 1
        i32.add
        local.set 6
        local.get 0
        i32.load offset=28
        local.set 7
        i32.const 45
        local.set 8
        br 1 (;@1;)
      end
      i32.const 43
      i32.const 1114112
      local.get 0
      i32.load offset=28
      local.tee 7
      i32.const 1
      i32.and
      local.tee 1
      select
      local.set 8
      local.get 1
      local.get 5
      i32.add
      local.set 6
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 7
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        br 1 (;@1;)
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          call $_ZN4core3str5count14do_count_chars17hc7dd2f4211067435E
          local.set 1
          br 1 (;@2;)
        end
        block  ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          br 1 (;@2;)
        end
        local.get 3
        i32.const 3
        i32.and
        local.set 9
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.const 4
            i32.ge_u
            br_if 0 (;@4;)
            i32.const 0
            local.set 1
            i32.const 0
            local.set 10
            br 1 (;@3;)
          end
          local.get 3
          i32.const 12
          i32.and
          local.set 11
          i32.const 0
          local.set 1
          i32.const 0
          local.set 10
          loop  ;; label = @4
            local.get 1
            local.get 2
            local.get 10
            i32.add
            local.tee 12
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 12
            i32.const 1
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 12
            i32.const 2
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 12
            i32.const 3
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 1
            local.get 11
            local.get 10
            i32.const 4
            i32.add
            local.tee 10
            i32.ne
            br_if 0 (;@4;)
          end
        end
        local.get 9
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 10
        i32.add
        local.set 12
        loop  ;; label = @3
          local.get 1
          local.get 12
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.set 1
          local.get 12
          i32.const 1
          i32.add
          local.set 12
          local.get 9
          i32.const -1
          i32.add
          local.tee 9
          br_if 0 (;@3;)
        end
      end
      local.get 1
      local.get 6
      i32.add
      local.set 6
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load
        br_if 0 (;@2;)
        i32.const 1
        local.set 1
        local.get 0
        i32.load offset=20
        local.tee 12
        local.get 0
        i32.load offset=24
        local.tee 10
        local.get 8
        local.get 2
        local.get 3
        call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h3b609045010e26aeE
        br_if 1 (;@1;)
        local.get 12
        local.get 4
        local.get 5
        local.get 10
        i32.load offset=12
        call_indirect (type 3)
        return
      end
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 9
        local.get 6
        i32.gt_u
        br_if 0 (;@2;)
        i32.const 1
        local.set 1
        local.get 0
        i32.load offset=20
        local.tee 12
        local.get 0
        i32.load offset=24
        local.tee 10
        local.get 8
        local.get 2
        local.get 3
        call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h3b609045010e26aeE
        br_if 1 (;@1;)
        local.get 12
        local.get 4
        local.get 5
        local.get 10
        i32.load offset=12
        call_indirect (type 3)
        return
      end
      block  ;; label = @2
        local.get 7
        i32.const 8
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=16
        local.set 11
        local.get 0
        i32.const 48
        i32.store offset=16
        local.get 0
        i32.load8_u offset=32
        local.set 7
        i32.const 1
        local.set 1
        local.get 0
        i32.const 1
        i32.store8 offset=32
        local.get 0
        i32.load offset=20
        local.tee 12
        local.get 0
        i32.load offset=24
        local.tee 10
        local.get 8
        local.get 2
        local.get 3
        call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h3b609045010e26aeE
        br_if 1 (;@1;)
        local.get 9
        local.get 6
        i32.sub
        i32.const 1
        i32.add
        local.set 1
        block  ;; label = @3
          loop  ;; label = @4
            local.get 1
            i32.const -1
            i32.add
            local.tee 1
            i32.eqz
            br_if 1 (;@3;)
            local.get 12
            i32.const 48
            local.get 10
            i32.load offset=16
            call_indirect (type 2)
            i32.eqz
            br_if 0 (;@4;)
          end
          i32.const 1
          return
        end
        i32.const 1
        local.set 1
        local.get 12
        local.get 4
        local.get 5
        local.get 10
        i32.load offset=12
        call_indirect (type 3)
        br_if 1 (;@1;)
        local.get 0
        local.get 7
        i32.store8 offset=32
        local.get 0
        local.get 11
        i32.store offset=16
        i32.const 0
        local.set 1
        br 1 (;@1;)
      end
      local.get 9
      local.get 6
      i32.sub
      local.set 6
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load8_u offset=32
            local.tee 1
            br_table 2 (;@2;) 0 (;@4;) 1 (;@3;) 0 (;@4;) 2 (;@2;)
          end
          local.get 6
          local.set 1
          i32.const 0
          local.set 6
          br 1 (;@2;)
        end
        local.get 6
        i32.const 1
        i32.shr_u
        local.set 1
        local.get 6
        i32.const 1
        i32.add
        i32.const 1
        i32.shr_u
        local.set 6
      end
      local.get 1
      i32.const 1
      i32.add
      local.set 1
      local.get 0
      i32.load offset=16
      local.set 9
      local.get 0
      i32.load offset=24
      local.set 12
      local.get 0
      i32.load offset=20
      local.set 10
      block  ;; label = @2
        loop  ;; label = @3
          local.get 1
          i32.const -1
          i32.add
          local.tee 1
          i32.eqz
          br_if 1 (;@2;)
          local.get 10
          local.get 9
          local.get 12
          i32.load offset=16
          call_indirect (type 2)
          i32.eqz
          br_if 0 (;@3;)
        end
        i32.const 1
        return
      end
      i32.const 1
      local.set 1
      local.get 10
      local.get 12
      local.get 8
      local.get 2
      local.get 3
      call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h3b609045010e26aeE
      br_if 0 (;@1;)
      local.get 10
      local.get 4
      local.get 5
      local.get 12
      i32.load offset=12
      call_indirect (type 3)
      br_if 0 (;@1;)
      i32.const 0
      local.set 1
      loop  ;; label = @2
        block  ;; label = @3
          local.get 6
          local.get 1
          i32.ne
          br_if 0 (;@3;)
          local.get 6
          local.get 6
          i32.lt_u
          return
        end
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 10
        local.get 9
        local.get 12
        i32.load offset=16
        call_indirect (type 2)
        i32.eqz
        br_if 0 (;@2;)
      end
      local.get 1
      i32.const -1
      i32.add
      local.get 6
      i32.lt_u
      return
    end
    local.get 1)
  (func $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h3b609045010e26aeE (type 13) (param i32 i32 i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 1114112
          i32.eq
          br_if 0 (;@3;)
          i32.const 1
          local.set 5
          local.get 0
          local.get 2
          local.get 1
          i32.load offset=16
          call_indirect (type 2)
          br_if 1 (;@2;)
        end
        local.get 3
        br_if 1 (;@1;)
        i32.const 0
        local.set 5
      end
      local.get 5
      return
    end
    local.get 0
    local.get 3
    local.get 4
    local.get 1
    i32.load offset=12
    call_indirect (type 3))
  (func $_ZN4core3fmt9Formatter3pad17h93200912c8de0739E (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 3
      local.get 0
      i32.load offset=8
      local.tee 4
      i32.or
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 2
        i32.add
        local.set 5
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load offset=12
            local.tee 6
            br_if 0 (;@4;)
            i32.const 0
            local.set 7
            local.get 1
            local.set 8
            br 1 (;@3;)
          end
          i32.const 0
          local.set 7
          local.get 1
          local.set 8
          loop  ;; label = @4
            local.get 8
            local.tee 4
            local.get 5
            i32.eq
            br_if 2 (;@2;)
            block  ;; label = @5
              block  ;; label = @6
                local.get 4
                i32.load8_s
                local.tee 8
                i32.const -1
                i32.le_s
                br_if 0 (;@6;)
                local.get 4
                i32.const 1
                i32.add
                local.set 8
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 8
                i32.const -32
                i32.ge_u
                br_if 0 (;@6;)
                local.get 4
                i32.const 2
                i32.add
                local.set 8
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 8
                i32.const -16
                i32.ge_u
                br_if 0 (;@6;)
                local.get 4
                i32.const 3
                i32.add
                local.set 8
                br 1 (;@5;)
              end
              local.get 4
              i32.load8_u offset=2
              i32.const 63
              i32.and
              i32.const 6
              i32.shl
              local.get 4
              i32.load8_u offset=1
              i32.const 63
              i32.and
              i32.const 12
              i32.shl
              i32.or
              local.get 4
              i32.load8_u offset=3
              i32.const 63
              i32.and
              i32.or
              local.get 8
              i32.const 255
              i32.and
              i32.const 18
              i32.shl
              i32.const 1835008
              i32.and
              i32.or
              i32.const 1114112
              i32.eq
              br_if 3 (;@2;)
              local.get 4
              i32.const 4
              i32.add
              local.set 8
            end
            local.get 7
            local.get 4
            i32.sub
            local.get 8
            i32.add
            local.set 7
            local.get 6
            i32.const -1
            i32.add
            local.tee 6
            br_if 0 (;@4;)
          end
        end
        local.get 8
        local.get 5
        i32.eq
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 8
          i32.load8_s
          local.tee 4
          i32.const -1
          i32.gt_s
          br_if 0 (;@3;)
          local.get 4
          i32.const -32
          i32.lt_u
          br_if 0 (;@3;)
          local.get 4
          i32.const -16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 8
          i32.load8_u offset=2
          i32.const 63
          i32.and
          i32.const 6
          i32.shl
          local.get 8
          i32.load8_u offset=1
          i32.const 63
          i32.and
          i32.const 12
          i32.shl
          i32.or
          local.get 8
          i32.load8_u offset=3
          i32.const 63
          i32.and
          i32.or
          local.get 4
          i32.const 255
          i32.and
          i32.const 18
          i32.shl
          i32.const 1835008
          i32.and
          i32.or
          i32.const 1114112
          i32.eq
          br_if 1 (;@2;)
        end
        block  ;; label = @3
          local.get 7
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 7
            local.get 2
            i32.lt_u
            br_if 0 (;@4;)
            local.get 7
            local.get 2
            i32.eq
            br_if 1 (;@3;)
            br 2 (;@2;)
          end
          local.get 1
          local.get 7
          i32.add
          i32.load8_s
          i32.const -64
          i32.lt_s
          br_if 1 (;@2;)
        end
        local.get 7
        local.set 2
      end
      block  ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=20
        local.get 1
        local.get 2
        local.get 0
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 3)
        return
      end
      local.get 0
      i32.load offset=4
      local.set 3
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 1
          local.get 2
          call $_ZN4core3str5count14do_count_chars17hc7dd2f4211067435E
          local.set 4
          br 1 (;@2;)
        end
        block  ;; label = @3
          local.get 2
          br_if 0 (;@3;)
          i32.const 0
          local.set 4
          br 1 (;@2;)
        end
        local.get 2
        i32.const 3
        i32.and
        local.set 6
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.const 4
            i32.ge_u
            br_if 0 (;@4;)
            i32.const 0
            local.set 4
            i32.const 0
            local.set 7
            br 1 (;@3;)
          end
          local.get 2
          i32.const 12
          i32.and
          local.set 5
          i32.const 0
          local.set 4
          i32.const 0
          local.set 7
          loop  ;; label = @4
            local.get 4
            local.get 1
            local.get 7
            i32.add
            local.tee 8
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 8
            i32.const 1
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 8
            i32.const 2
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 8
            i32.const 3
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 4
            local.get 5
            local.get 7
            i32.const 4
            i32.add
            local.tee 7
            i32.ne
            br_if 0 (;@4;)
          end
        end
        local.get 6
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 7
        i32.add
        local.set 8
        loop  ;; label = @3
          local.get 4
          local.get 8
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.set 4
          local.get 8
          i32.const 1
          i32.add
          local.set 8
          local.get 6
          i32.const -1
          i32.add
          local.tee 6
          br_if 0 (;@3;)
        end
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          local.get 4
          i32.le_u
          br_if 0 (;@3;)
          local.get 3
          local.get 4
          i32.sub
          local.set 5
          i32.const 0
          local.set 4
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load8_u offset=32
                br_table 2 (;@4;) 0 (;@6;) 1 (;@5;) 2 (;@4;) 2 (;@4;)
              end
              local.get 5
              local.set 4
              i32.const 0
              local.set 5
              br 1 (;@4;)
            end
            local.get 5
            i32.const 1
            i32.shr_u
            local.set 4
            local.get 5
            i32.const 1
            i32.add
            i32.const 1
            i32.shr_u
            local.set 5
          end
          local.get 4
          i32.const 1
          i32.add
          local.set 4
          local.get 0
          i32.load offset=16
          local.set 6
          local.get 0
          i32.load offset=24
          local.set 8
          local.get 0
          i32.load offset=20
          local.set 7
          loop  ;; label = @4
            local.get 4
            i32.const -1
            i32.add
            local.tee 4
            i32.eqz
            br_if 2 (;@2;)
            local.get 7
            local.get 6
            local.get 8
            i32.load offset=16
            call_indirect (type 2)
            i32.eqz
            br_if 0 (;@4;)
          end
          i32.const 1
          return
        end
        local.get 0
        i32.load offset=20
        local.get 1
        local.get 2
        local.get 0
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 3)
        return
      end
      i32.const 1
      local.set 4
      block  ;; label = @2
        local.get 7
        local.get 1
        local.get 2
        local.get 8
        i32.load offset=12
        call_indirect (type 3)
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        block  ;; label = @3
          loop  ;; label = @4
            block  ;; label = @5
              local.get 5
              local.get 4
              i32.ne
              br_if 0 (;@5;)
              local.get 5
              local.set 4
              br 2 (;@3;)
            end
            local.get 4
            i32.const 1
            i32.add
            local.set 4
            local.get 7
            local.get 6
            local.get 8
            i32.load offset=16
            call_indirect (type 2)
            i32.eqz
            br_if 0 (;@4;)
          end
          local.get 4
          i32.const -1
          i32.add
          local.set 4
        end
        local.get 4
        local.get 5
        i32.lt_u
        local.set 4
      end
      local.get 4
      return
    end
    local.get 0
    i32.load offset=20
    local.get 1
    local.get 2
    local.get 0
    i32.load offset=24
    i32.load offset=12
    call_indirect (type 3))
  (func $_ZN4core3fmt9Formatter9write_str17h1fe892ce632ffc37E (type 3) (param i32 i32 i32) (result i32)
    local.get 0
    i32.load offset=20
    local.get 1
    local.get 2
    local.get 0
    i32.load offset=24
    i32.load offset=12
    call_indirect (type 3))
  (func $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h88408237604245e2E (type 3) (param i32 i32 i32) (result i32)
    local.get 2
    local.get 0
    local.get 1
    call $_ZN4core3fmt9Formatter3pad17h93200912c8de0739E)
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h7444cfe9f847f71eE (type 2) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    local.get 0
    i32.load offset=4
    i32.load offset=12
    call_indirect (type 2))
  (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h3311e449c4f06445E (type 2) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    call $_ZN4core3fmt9Formatter3pad17h93200912c8de0739E)
  (func $_ZN4core3ptr88drop_in_place$LT$core..panic..panic_info..PanicInfo..internal_constructor..NoPayload$GT$17hbcc9e157a10fdfcaE (type 0) (param i32))
  (func $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE (type 1) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 1
    i32.store16 offset=28
    local.get 2
    local.get 1
    i32.store offset=24
    local.get 2
    local.get 0
    i32.store offset=20
    local.get 2
    i32.const 1053264
    i32.store offset=16
    local.get 2
    i32.const 1053264
    i32.store offset=12
    local.get 2
    i32.const 12
    i32.add
    call $rust_begin_unwind
    unreachable)
  (func $_ZN4core9panicking5panic17h5183d2125e960738E (type 6) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 1
    i32.store offset=4
    local.get 3
    i64.const 0
    i64.store offset=12 align=4
    local.get 3
    i32.const 1053264
    i32.store offset=8
    local.get 3
    local.get 1
    i32.store offset=28
    local.get 3
    local.get 0
    i32.store offset=24
    local.get 3
    local.get 3
    i32.const 24
    i32.add
    i32.store
    local.get 3
    local.get 2
    call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
    unreachable)
  (func $_ZN4core5slice6memchr7memrchr17h0f954a0b5e3b458fE (type 7) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    local.get 3
    i32.const 0
    local.get 3
    local.get 2
    i32.const 3
    i32.add
    i32.const -4
    i32.and
    local.get 2
    i32.sub
    local.tee 4
    i32.sub
    i32.const 7
    i32.and
    local.get 3
    local.get 4
    i32.lt_u
    select
    local.tee 5
    i32.sub
    local.set 6
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            local.get 5
            i32.lt_u
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 5
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              local.get 3
              i32.add
              local.tee 5
              local.get 2
              local.get 6
              i32.add
              local.tee 7
              i32.sub
              local.set 8
              block  ;; label = @6
                block  ;; label = @7
                  local.get 5
                  i32.const -1
                  i32.add
                  local.tee 9
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -1
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 9
                i32.eq
                br_if 1 (;@5;)
                block  ;; label = @7
                  local.get 5
                  i32.const -2
                  i32.add
                  local.tee 9
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -2
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 9
                i32.eq
                br_if 1 (;@5;)
                block  ;; label = @7
                  local.get 5
                  i32.const -3
                  i32.add
                  local.tee 9
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -3
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 9
                i32.eq
                br_if 1 (;@5;)
                block  ;; label = @7
                  local.get 5
                  i32.const -4
                  i32.add
                  local.tee 9
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -4
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 9
                i32.eq
                br_if 1 (;@5;)
                block  ;; label = @7
                  local.get 5
                  i32.const -5
                  i32.add
                  local.tee 9
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -5
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 9
                i32.eq
                br_if 1 (;@5;)
                block  ;; label = @7
                  local.get 5
                  i32.const -6
                  i32.add
                  local.tee 9
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -6
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 9
                i32.eq
                br_if 1 (;@5;)
                block  ;; label = @7
                  local.get 5
                  i32.const -7
                  i32.add
                  local.tee 5
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -7
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 5
                i32.eq
                br_if 1 (;@5;)
                local.get 8
                i32.const -8
                i32.add
                local.set 4
              end
              local.get 4
              local.get 6
              i32.add
              local.set 4
              br 3 (;@2;)
            end
            local.get 4
            local.get 3
            local.get 3
            local.get 4
            i32.gt_u
            select
            local.set 9
            local.get 1
            i32.const 255
            i32.and
            i32.const 16843009
            i32.mul
            local.set 5
            block  ;; label = @5
              loop  ;; label = @6
                local.get 6
                local.tee 4
                local.get 9
                i32.le_u
                br_if 1 (;@5;)
                local.get 4
                i32.const -8
                i32.add
                local.set 6
                local.get 2
                local.get 4
                i32.add
                local.tee 8
                i32.const -4
                i32.add
                i32.load
                local.get 5
                i32.xor
                local.tee 7
                i32.const -16843009
                i32.add
                local.get 7
                i32.const -1
                i32.xor
                i32.and
                local.get 8
                i32.const -8
                i32.add
                i32.load
                local.get 5
                i32.xor
                local.tee 8
                i32.const -16843009
                i32.add
                local.get 8
                i32.const -1
                i32.xor
                i32.and
                i32.or
                i32.const -2139062144
                i32.and
                i32.eqz
                br_if 0 (;@6;)
              end
            end
            local.get 4
            local.get 3
            i32.gt_u
            br_if 1 (;@3;)
            local.get 2
            i32.const -1
            i32.add
            local.set 5
            local.get 1
            i32.const 255
            i32.and
            local.set 8
            loop  ;; label = @5
              block  ;; label = @6
                local.get 4
                br_if 0 (;@6;)
                i32.const 0
                local.set 6
                br 5 (;@1;)
              end
              local.get 5
              local.get 4
              i32.add
              local.set 6
              local.get 4
              i32.const -1
              i32.add
              local.set 4
              local.get 6
              i32.load8_u
              local.get 8
              i32.eq
              br_if 3 (;@2;)
              br 0 (;@5;)
            end
          end
          local.get 6
          local.get 3
          i32.const 1053408
          call $_ZN4core5slice5index26slice_start_index_len_fail17h4bfaad2f663cf380E
          unreachable
        end
        local.get 4
        local.get 3
        i32.const 1053424
        call $_ZN4core5slice5index24slice_end_index_len_fail17h9bcf50050671ed30E
        unreachable
      end
      i32.const 1
      local.set 6
    end
    local.get 0
    local.get 4
    i32.store offset=4
    local.get 0
    local.get 6
    i32.store)
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h0a105c0c144e43f9E (type 1) (param i32 i32)
    local.get 0
    i64.const -5918158352840079641
    i64.store offset=8
    local.get 0
    i64.const 439319701636951332
    i64.store)
  (func $_ZN73_$LT$core..panic..panic_info..PanicInfo$u20$as$u20$core..fmt..Display$GT$3fmt17hbb48b73a4a2a8746E (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    i32.const 1
    local.set 3
    block  ;; label = @1
      local.get 1
      i32.load offset=20
      local.tee 4
      i32.const 1053440
      i32.const 12
      local.get 1
      i32.load offset=24
      local.tee 5
      i32.load offset=12
      local.tee 6
      call_indirect (type 3)
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=12
      local.set 1
      local.get 2
      i32.const 60
      i32.add
      i32.const 8
      i32.store
      local.get 2
      i32.const 40
      i32.add
      i32.const 12
      i32.add
      i32.const 8
      i32.store
      local.get 2
      i32.const 3
      i32.store offset=20
      local.get 2
      i32.const 1053928
      i32.store offset=16
      local.get 2
      i64.const 3
      i64.store offset=28 align=4
      local.get 2
      local.get 1
      i32.const 12
      i32.add
      i32.store offset=56
      local.get 2
      local.get 1
      i32.const 8
      i32.add
      i32.store offset=48
      local.get 2
      i32.const 60
      i32.store offset=44
      local.get 2
      local.get 1
      i32.store offset=40
      local.get 2
      local.get 2
      i32.const 40
      i32.add
      i32.store offset=24
      local.get 4
      local.get 5
      local.get 2
      i32.const 16
      i32.add
      call $_ZN4core3fmt5write17h55b62ec8489b4effE
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load offset=8
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          i32.const 1053452
          i32.const 2
          local.get 6
          call_indirect (type 3)
          br_if 2 (;@1;)
          local.get 2
          i32.const 40
          i32.add
          i32.const 16
          i32.add
          local.get 1
          i32.const 16
          i32.add
          i64.load align=4
          i64.store
          local.get 2
          i32.const 40
          i32.add
          i32.const 8
          i32.add
          local.get 1
          i32.const 8
          i32.add
          i64.load align=4
          i64.store
          local.get 2
          local.get 1
          i64.load align=4
          i64.store offset=40
          local.get 4
          local.get 5
          local.get 2
          i32.const 40
          i32.add
          call $_ZN4core3fmt5write17h55b62ec8489b4effE
          i32.eqz
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        local.get 2
        local.get 0
        i32.load
        local.tee 1
        local.get 0
        i32.load offset=4
        i32.const 12
        i32.add
        i32.load
        call_indirect (type 1)
        local.get 2
        i64.load
        i64.const -163230743173927068
        i64.ne
        br_if 0 (;@2;)
        local.get 2
        i64.load offset=8
        i64.const -4493808902380553279
        i64.ne
        br_if 0 (;@2;)
        local.get 4
        i32.const 1053452
        i32.const 2
        local.get 6
        call_indirect (type 3)
        br_if 1 (;@1;)
        local.get 4
        local.get 1
        i32.load
        local.get 1
        i32.load offset=4
        local.get 6
        call_indirect (type 3)
        br_if 1 (;@1;)
      end
      i32.const 0
      local.set 3
    end
    local.get 2
    i32.const 64
    i32.add
    global.set $__stack_pointer
    local.get 3)
  (func $_ZN87_$LT$core..str..lossy..Utf8Chunks$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hda991ca6d6612cbfE (type 1) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 1
      i32.load offset=4
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.load
      local.set 3
      i32.const 0
      local.set 4
      block  ;; label = @2
        loop  ;; label = @3
          local.get 4
          i32.const 1
          i32.add
          local.set 5
          block  ;; label = @4
            block  ;; label = @5
              local.get 3
              local.get 4
              i32.add
              i32.load8_u
              local.tee 6
              i32.extend8_s
              local.tee 7
              i32.const -1
              i32.le_s
              br_if 0 (;@5;)
              local.get 5
              local.set 4
              br 1 (;@4;)
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 6
                                  i32.const 1053454
                                  i32.add
                                  i32.load8_u
                                  i32.const -2
                                  i32.add
                                  br_table 0 (;@15;) 1 (;@14;) 2 (;@13;) 13 (;@2;)
                                end
                                local.get 3
                                local.get 5
                                i32.add
                                i32.const 1053710
                                local.get 5
                                local.get 2
                                i32.lt_u
                                select
                                i32.load8_u
                                i32.const 192
                                i32.and
                                i32.const 128
                                i32.ne
                                br_if 12 (;@2;)
                                local.get 4
                                i32.const 2
                                i32.add
                                local.set 4
                                br 10 (;@4;)
                              end
                              local.get 3
                              local.get 5
                              i32.add
                              i32.const 1053710
                              local.get 5
                              local.get 2
                              i32.lt_u
                              select
                              i32.load8_s
                              local.set 8
                              local.get 6
                              i32.const -224
                              i32.add
                              br_table 1 (;@12;) 3 (;@10;) 3 (;@10;) 3 (;@10;) 3 (;@10;) 3 (;@10;) 3 (;@10;) 3 (;@10;) 3 (;@10;) 3 (;@10;) 3 (;@10;) 3 (;@10;) 3 (;@10;) 2 (;@11;) 3 (;@10;)
                            end
                            local.get 3
                            local.get 5
                            i32.add
                            i32.const 1053710
                            local.get 5
                            local.get 2
                            i32.lt_u
                            select
                            i32.load8_s
                            local.set 8
                            local.get 6
                            i32.const -240
                            i32.add
                            br_table 4 (;@8;) 3 (;@9;) 3 (;@9;) 3 (;@9;) 5 (;@7;) 3 (;@9;)
                          end
                          local.get 8
                          i32.const -32
                          i32.and
                          i32.const -96
                          i32.ne
                          br_if 9 (;@2;)
                          br 6 (;@5;)
                        end
                        local.get 8
                        i32.const -97
                        i32.gt_s
                        br_if 8 (;@2;)
                        br 5 (;@5;)
                      end
                      block  ;; label = @10
                        local.get 7
                        i32.const 31
                        i32.add
                        i32.const 255
                        i32.and
                        i32.const 12
                        i32.lt_u
                        br_if 0 (;@10;)
                        local.get 7
                        i32.const -2
                        i32.and
                        i32.const -18
                        i32.ne
                        br_if 8 (;@2;)
                        local.get 8
                        i32.const -64
                        i32.ge_s
                        br_if 8 (;@2;)
                        br 5 (;@5;)
                      end
                      local.get 8
                      i32.const -64
                      i32.ge_s
                      br_if 7 (;@2;)
                      br 4 (;@5;)
                    end
                    local.get 7
                    i32.const 15
                    i32.add
                    i32.const 255
                    i32.and
                    i32.const 2
                    i32.gt_u
                    br_if 6 (;@2;)
                    local.get 8
                    i32.const -64
                    i32.ge_s
                    br_if 6 (;@2;)
                    br 2 (;@6;)
                  end
                  local.get 8
                  i32.const 112
                  i32.add
                  i32.const 255
                  i32.and
                  i32.const 48
                  i32.ge_u
                  br_if 5 (;@2;)
                  br 1 (;@6;)
                end
                local.get 8
                i32.const -113
                i32.gt_s
                br_if 4 (;@2;)
              end
              local.get 3
              local.get 4
              i32.const 2
              i32.add
              local.tee 5
              i32.add
              i32.const 1053710
              local.get 5
              local.get 2
              i32.lt_u
              select
              i32.load8_u
              i32.const 192
              i32.and
              i32.const 128
              i32.ne
              br_if 3 (;@2;)
              local.get 3
              local.get 4
              i32.const 3
              i32.add
              local.tee 5
              i32.add
              i32.const 1053710
              local.get 5
              local.get 2
              i32.lt_u
              select
              i32.load8_u
              i32.const 192
              i32.and
              i32.const 128
              i32.ne
              br_if 3 (;@2;)
              local.get 4
              i32.const 4
              i32.add
              local.set 4
              br 1 (;@4;)
            end
            local.get 3
            local.get 4
            i32.const 2
            i32.add
            local.tee 5
            i32.add
            i32.const 1053710
            local.get 5
            local.get 2
            i32.lt_u
            select
            i32.load8_u
            i32.const 192
            i32.and
            i32.const 128
            i32.ne
            br_if 2 (;@2;)
            local.get 4
            i32.const 3
            i32.add
            local.set 4
          end
          local.get 4
          local.set 5
          local.get 4
          local.get 2
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 0
      local.get 4
      i32.store offset=4
      local.get 0
      local.get 3
      i32.store
      local.get 1
      local.get 2
      local.get 5
      i32.sub
      i32.store offset=4
      local.get 1
      local.get 3
      local.get 5
      i32.add
      i32.store
      local.get 0
      local.get 5
      local.get 4
      i32.sub
      i32.store offset=12
      local.get 0
      local.get 3
      local.get 4
      i32.add
      i32.store offset=8
      return
    end
    local.get 0
    i32.const 0
    i32.store)
  (func $_ZN4core3str5count14do_count_chars17hc7dd2f4211067435E (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        local.get 0
        i32.const 3
        i32.add
        i32.const -4
        i32.and
        local.tee 2
        local.get 0
        i32.sub
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 1
        local.get 3
        i32.sub
        local.tee 4
        i32.const 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 4
        i32.const 3
        i32.and
        local.set 5
        i32.const 0
        local.set 6
        i32.const 0
        local.set 1
        block  ;; label = @3
          local.get 2
          local.get 0
          i32.eq
          local.tee 7
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              local.get 2
              i32.sub
              local.tee 8
              i32.const -4
              i32.le_u
              br_if 0 (;@5;)
              i32.const 0
              local.set 9
              br 1 (;@4;)
            end
            i32.const 0
            local.set 9
            loop  ;; label = @5
              local.get 1
              local.get 0
              local.get 9
              i32.add
              local.tee 2
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 2
              i32.const 1
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 2
              i32.const 2
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 2
              i32.const 3
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.set 1
              local.get 9
              i32.const 4
              i32.add
              local.tee 9
              br_if 0 (;@5;)
            end
          end
          local.get 7
          br_if 0 (;@3;)
          local.get 0
          local.get 9
          i32.add
          local.set 2
          loop  ;; label = @4
            local.get 1
            local.get 2
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 1
            local.get 2
            i32.const 1
            i32.add
            local.set 2
            local.get 8
            i32.const 1
            i32.add
            local.tee 8
            br_if 0 (;@4;)
          end
        end
        local.get 0
        local.get 3
        i32.add
        local.set 9
        block  ;; label = @3
          local.get 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 9
          local.get 4
          i32.const -4
          i32.and
          i32.add
          local.tee 2
          i32.load8_s
          i32.const -65
          i32.gt_s
          local.set 6
          local.get 5
          i32.const 1
          i32.eq
          br_if 0 (;@3;)
          local.get 6
          local.get 2
          i32.load8_s offset=1
          i32.const -65
          i32.gt_s
          i32.add
          local.set 6
          local.get 5
          i32.const 2
          i32.eq
          br_if 0 (;@3;)
          local.get 6
          local.get 2
          i32.load8_s offset=2
          i32.const -65
          i32.gt_s
          i32.add
          local.set 6
        end
        local.get 4
        i32.const 2
        i32.shr_u
        local.set 3
        local.get 6
        local.get 1
        i32.add
        local.set 8
        loop  ;; label = @3
          local.get 9
          local.set 4
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          i32.const 192
          local.get 3
          i32.const 192
          i32.lt_u
          select
          local.tee 6
          i32.const 3
          i32.and
          local.set 7
          local.get 6
          i32.const 2
          i32.shl
          local.set 5
          i32.const 0
          local.set 2
          block  ;; label = @4
            local.get 3
            i32.const 4
            i32.lt_u
            br_if 0 (;@4;)
            local.get 4
            local.get 5
            i32.const 1008
            i32.and
            i32.add
            local.set 0
            i32.const 0
            local.set 2
            local.get 4
            local.set 1
            loop  ;; label = @5
              local.get 1
              i32.load
              local.tee 9
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 9
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              local.get 2
              i32.add
              local.get 1
              i32.load offset=4
              local.tee 2
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 2
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              i32.add
              local.get 1
              i32.load offset=8
              local.tee 2
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 2
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              i32.add
              local.get 1
              i32.load offset=12
              local.tee 2
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 2
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              i32.add
              local.set 2
              local.get 1
              i32.const 16
              i32.add
              local.tee 1
              local.get 0
              i32.ne
              br_if 0 (;@5;)
            end
          end
          local.get 3
          local.get 6
          i32.sub
          local.set 3
          local.get 4
          local.get 5
          i32.add
          local.set 9
          local.get 2
          i32.const 8
          i32.shr_u
          i32.const 16711935
          i32.and
          local.get 2
          i32.const 16711935
          i32.and
          i32.add
          i32.const 65537
          i32.mul
          i32.const 16
          i32.shr_u
          local.get 8
          i32.add
          local.set 8
          local.get 7
          i32.eqz
          br_if 0 (;@3;)
        end
        local.get 4
        local.get 6
        i32.const 252
        i32.and
        i32.const 2
        i32.shl
        i32.add
        local.tee 2
        i32.load
        local.tee 1
        i32.const -1
        i32.xor
        i32.const 7
        i32.shr_u
        local.get 1
        i32.const 6
        i32.shr_u
        i32.or
        i32.const 16843009
        i32.and
        local.set 1
        block  ;; label = @3
          local.get 7
          i32.const 1
          i32.eq
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=4
          local.tee 9
          i32.const -1
          i32.xor
          i32.const 7
          i32.shr_u
          local.get 9
          i32.const 6
          i32.shr_u
          i32.or
          i32.const 16843009
          i32.and
          local.get 1
          i32.add
          local.set 1
          local.get 7
          i32.const 2
          i32.eq
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=8
          local.tee 2
          i32.const -1
          i32.xor
          i32.const 7
          i32.shr_u
          local.get 2
          i32.const 6
          i32.shr_u
          i32.or
          i32.const 16843009
          i32.and
          local.get 1
          i32.add
          local.set 1
        end
        local.get 1
        i32.const 8
        i32.shr_u
        i32.const 459007
        i32.and
        local.get 1
        i32.const 16711935
        i32.and
        i32.add
        i32.const 65537
        i32.mul
        i32.const 16
        i32.shr_u
        local.get 8
        i32.add
        return
      end
      block  ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        i32.const 0
        return
      end
      local.get 1
      i32.const 3
      i32.and
      local.set 9
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.const 4
          i32.ge_u
          br_if 0 (;@3;)
          i32.const 0
          local.set 8
          i32.const 0
          local.set 2
          br 1 (;@2;)
        end
        local.get 1
        i32.const -4
        i32.and
        local.set 3
        i32.const 0
        local.set 8
        i32.const 0
        local.set 2
        loop  ;; label = @3
          local.get 8
          local.get 0
          local.get 2
          i32.add
          local.tee 1
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.get 1
          i32.const 1
          i32.add
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.get 1
          i32.const 2
          i32.add
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.get 1
          i32.const 3
          i32.add
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.set 8
          local.get 3
          local.get 2
          i32.const 4
          i32.add
          local.tee 2
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 9
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 8
        local.get 1
        i32.load8_s
        i32.const -65
        i32.gt_s
        i32.add
        local.set 8
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 9
        i32.const -1
        i32.add
        local.tee 9
        br_if 0 (;@2;)
      end
    end
    local.get 8)
  (func $_ZN4core3fmt3num3imp7fmt_u6417h3b7bbe8f178c4c80E.llvm.7982189259866861802 (type 14) (param i64 i32 i32) (result i32)
    (local i32 i32 i64 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    i32.const 39
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i64.const 10000
        i64.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.set 5
        br 1 (;@1;)
      end
      i32.const 39
      local.set 4
      loop  ;; label = @2
        local.get 3
        i32.const 9
        i32.add
        local.get 4
        i32.add
        local.tee 6
        i32.const -4
        i32.add
        local.get 0
        local.get 0
        i64.const 10000
        i64.div_u
        local.tee 5
        i64.const 10000
        i64.mul
        i64.sub
        i32.wrap_i64
        local.tee 7
        i32.const 65535
        i32.and
        i32.const 100
        i32.div_u
        local.tee 8
        i32.const 1
        i32.shl
        i32.const 1053064
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        local.get 6
        i32.const -2
        i32.add
        local.get 7
        local.get 8
        i32.const 100
        i32.mul
        i32.sub
        i32.const 65535
        i32.and
        i32.const 1
        i32.shl
        i32.const 1053064
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        local.get 4
        i32.const -4
        i32.add
        local.set 4
        local.get 0
        i64.const 99999999
        i64.gt_u
        local.set 6
        local.get 5
        local.set 0
        local.get 6
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 5
      i32.wrap_i64
      local.tee 6
      i32.const 99
      i32.le_u
      br_if 0 (;@1;)
      local.get 3
      i32.const 9
      i32.add
      local.get 4
      i32.const -2
      i32.add
      local.tee 4
      i32.add
      local.get 5
      i32.wrap_i64
      local.tee 6
      local.get 6
      i32.const 65535
      i32.and
      i32.const 100
      i32.div_u
      local.tee 6
      i32.const 100
      i32.mul
      i32.sub
      i32.const 65535
      i32.and
      i32.const 1
      i32.shl
      i32.const 1053064
      i32.add
      i32.load16_u align=1
      i32.store16 align=1
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 6
        i32.const 10
        i32.lt_u
        br_if 0 (;@2;)
        local.get 3
        i32.const 9
        i32.add
        local.get 4
        i32.const -2
        i32.add
        local.tee 4
        i32.add
        local.get 6
        i32.const 1
        i32.shl
        i32.const 1053064
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        br 1 (;@1;)
      end
      local.get 3
      i32.const 9
      i32.add
      local.get 4
      i32.const -1
      i32.add
      local.tee 4
      i32.add
      local.get 6
      i32.const 48
      i32.or
      i32.store8
    end
    local.get 2
    local.get 1
    i32.const 1053712
    i32.const 0
    local.get 3
    i32.const 9
    i32.add
    local.get 4
    i32.add
    i32.const 39
    local.get 4
    i32.sub
    call $_ZN4core3fmt9Formatter12pad_integral17h0f3b9f3b71d03c2bE
    local.set 4
    local.get 3
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 4)
  (func $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$i32$GT$3fmt17h0d225e8f6f3c78c6E (type 2) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    i32.load
    local.tee 0
    local.get 0
    i32.const 31
    i32.shr_s
    local.tee 2
    i32.xor
    local.get 2
    i32.sub
    i64.extend_i32_u
    local.get 0
    i32.const -1
    i32.xor
    i32.const 31
    i32.shr_u
    local.get 1
    call $_ZN4core3fmt3num3imp7fmt_u6417h3b7bbe8f178c4c80E.llvm.7982189259866861802)
  (func $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hba80b56c6635a03fE (type 2) (param i32 i32) (result i32)
    local.get 0
    i64.load32_u
    i32.const 1
    local.get 1
    call $_ZN4core3fmt3num3imp7fmt_u6417h3b7bbe8f178c4c80E.llvm.7982189259866861802)
  (func $_ZN63_$LT$core..cell..BorrowMutError$u20$as$u20$core..fmt..Debug$GT$3fmt17h7b6815a6f9ee6c49E (type 2) (param i32 i32) (result i32)
    local.get 1
    i32.load offset=20
    i32.const 1053712
    i32.const 14
    local.get 1
    i32.load offset=24
    i32.load offset=12
    call_indirect (type 3))
  (func $_ZN4core4cell22panic_already_borrowed17hfa55c2be5c5c6eb4E (type 0) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 1
    i32.store offset=16
    local.get 1
    i32.const 1053744
    i32.store offset=12
    local.get 1
    i64.const 1
    i64.store offset=24 align=4
    local.get 1
    i32.const 61
    i32.store offset=40
    local.get 1
    local.get 1
    i32.const 36
    i32.add
    i32.store offset=20
    local.get 1
    local.get 1
    i32.const 47
    i32.add
    i32.store offset=36
    local.get 1
    i32.const 12
    i32.add
    local.get 0
    call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
    unreachable)
  (func $_ZN4core6option13unwrap_failed17h7da440408d6f3f41E (type 0) (param i32)
    i32.const 1053752
    i32.const 43
    local.get 0
    call $_ZN4core9panicking5panic17h5183d2125e960738E
    unreachable)
  (func $_ZN4core6option13expect_failed17hc92345a96811243cE (type 6) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 1
    i32.store offset=12
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call $_ZN4core9panicking13panic_display17hfad406ac5ff98458E
    unreachable)
  (func $_ZN4core9panicking13panic_display17hfad406ac5ff98458E (type 1) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 1
    i32.store offset=4
    local.get 2
    i32.const 1053796
    i32.store
    local.get 2
    i64.const 1
    i64.store offset=12 align=4
    local.get 2
    i32.const 60
    i32.store offset=28
    local.get 2
    local.get 0
    i32.store offset=24
    local.get 2
    local.get 2
    i32.const 24
    i32.add
    i32.store offset=8
    local.get 2
    local.get 1
    call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
    unreachable)
  (func $_ZN4core6result13unwrap_failed17ha1a4a677361ebda3E (type 15) (param i32 i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    local.get 5
    local.get 1
    i32.store offset=12
    local.get 5
    local.get 0
    i32.store offset=8
    local.get 5
    local.get 3
    i32.store offset=20
    local.get 5
    local.get 2
    i32.store offset=16
    local.get 5
    i32.const 60
    i32.add
    i32.const 62
    i32.store
    local.get 5
    i32.const 2
    i32.store offset=28
    local.get 5
    i32.const 1053808
    i32.store offset=24
    local.get 5
    i64.const 2
    i64.store offset=36 align=4
    local.get 5
    i32.const 60
    i32.store offset=52
    local.get 5
    local.get 5
    i32.const 48
    i32.add
    i32.store offset=32
    local.get 5
    local.get 5
    i32.const 16
    i32.add
    i32.store offset=56
    local.get 5
    local.get 5
    i32.const 8
    i32.add
    i32.store offset=48
    local.get 5
    i32.const 24
    i32.add
    local.get 4
    call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
    unreachable)
  (func $_ZN4core5slice5index24slice_end_index_len_fail17h9bcf50050671ed30E (type 6) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN4core5slice5index27slice_end_index_len_fail_rt17h97bf3a7cb4ee590cE
    unreachable)
  (func $_ZN4core5slice5index26slice_start_index_len_fail17h4bfaad2f663cf380E (type 6) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN4core5slice5index29slice_start_index_len_fail_rt17h8d73f493a4c5849fE
    unreachable)
  (func $_ZN4core5slice5index29slice_start_index_len_fail_rt17h8d73f493a4c5849fE (type 6) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 0
    i32.store
    local.get 3
    i32.const 44
    i32.add
    i32.const 8
    i32.store
    local.get 3
    i32.const 2
    i32.store offset=12
    local.get 3
    i32.const 1053876
    i32.store offset=8
    local.get 3
    i64.const 2
    i64.store offset=20 align=4
    local.get 3
    i32.const 8
    i32.store offset=36
    local.get 3
    local.get 3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 3
    local.get 3
    i32.const 4
    i32.add
    i32.store offset=40
    local.get 3
    local.get 3
    i32.store offset=32
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
    unreachable)
  (func $_ZN4core5slice5index27slice_end_index_len_fail_rt17h97bf3a7cb4ee590cE (type 6) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 0
    i32.store
    local.get 3
    i32.const 44
    i32.add
    i32.const 8
    i32.store
    local.get 3
    i32.const 2
    i32.store offset=12
    local.get 3
    i32.const 1053908
    i32.store offset=8
    local.get 3
    i64.const 2
    i64.store offset=20 align=4
    local.get 3
    i32.const 8
    i32.store offset=36
    local.get 3
    local.get 3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 3
    local.get 3
    i32.const 4
    i32.add
    i32.store offset=40
    local.get 3
    local.get 3
    i32.store offset=32
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
    unreachable)
  (func $_ZN4core3ops8function6FnOnce9call_once17hc6d1905079f8f33bE.llvm.16891890523046555270 (type 2) (param i32 i32) (result i32)
    local.get 0
    i32.load
    drop
    loop (result i32)  ;; label = @1
      br 0 (;@1;)
    end)
  (func $__multi3 (type 16) (param i32 i64 i64 i64 i64)
    (local i64 i64 i64 i64 i64 i64)
    local.get 0
    local.get 3
    i64.const 4294967295
    i64.and
    local.tee 5
    local.get 1
    i64.const 4294967295
    i64.and
    local.tee 6
    i64.mul
    local.tee 7
    local.get 3
    i64.const 32
    i64.shr_u
    local.tee 8
    local.get 6
    i64.mul
    local.tee 6
    local.get 5
    local.get 1
    i64.const 32
    i64.shr_u
    local.tee 9
    i64.mul
    i64.add
    local.tee 5
    i64.const 32
    i64.shl
    i64.add
    local.tee 10
    i64.store
    local.get 0
    local.get 8
    local.get 9
    i64.mul
    local.get 5
    local.get 6
    i64.lt_u
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 5
    i64.const 32
    i64.shr_u
    i64.or
    i64.add
    local.get 10
    local.get 7
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.get 4
    local.get 1
    i64.mul
    local.get 3
    local.get 2
    i64.mul
    i64.add
    i64.add
    i64.store offset=8)
  (table (;0;) 63 63 funcref)
  (global $__stack_pointer (mut i32) (i32.const 1048576))
  (global $__tls_base (mut i32) (i32.const 0))
  (global $__tls_size i32 (i32.const 24))
  (global $__tls_align i32 (i32.const 4))
  (global (;4;) i32 (i32.const 1054480))
  (global (;5;) i32 (i32.const 1054480))
  (export "__tls_base" (global $__tls_base))
  (export "__tls_size" (global $__tls_size))
  (export "__tls_align" (global $__tls_align))
  (export "__wasm_init_tls" (func $__wasm_init_tls))
  (export "_start" (func $_start))
  (export "__data_end" (global 4))
  (export "__heap_base" (global 5))
  (start $__wasm_init_memory)
  (elem (;0;) (i32.const 1) func $_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17hfb89e3d6c2568f08E.llvm.12628461014352780869 $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17hed41479ee867d133E $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h52d87c11c795cdddE $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17had9e027a1aa3b2ccE $_ZN4core3fmt5Write9write_fmt17ha9ac37fb789f75c0E $_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17hfb89e3d6c2568f08E $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hcdd6221b2f2b34a3E $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hba80b56c6635a03fE $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17hed41479ee867d133E.1 $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h52d87c11c795cdddE.1 $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17had9e027a1aa3b2ccE.1 $_ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17ha872a7de228e8298E $_ZN53_$LT$core..fmt..Error$u20$as$u20$core..fmt..Debug$GT$3fmt17haf1074f0f9151d42E $_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17hbd22de30bea3fa42E $_ZN10bootloader6_start28_$u7b$$u7b$closure$u7d$$u7d$17h7bcceeaf4923263bE $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h3bceb8e6c5131c36E $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h52d87c11c795cdddE.2 $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17had9e027a1aa3b2ccE.2 $_ZN4core3fmt5Write9write_fmt17hfacdb15f35c6f2c4E $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h6e31f183a6d51aa5E $_ZN4core3ptr28drop_in_place$LT$$RF$str$GT$17h800211bd58f2cc07E $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h523f35a5a41ea52fE $_ZN4core3ptr88drop_in_place$LT$core..panic..panic_info..PanicInfo..internal_constructor..NoPayload$GT$17h2ef38da117d3f36eE.llvm.13317409777152324161 $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17ha7f99a7273f54626E $_ZN3std5alloc24default_alloc_error_hook17hb10cd7b0607bc6b3E $_ZN60_$LT$std..io..error..Error$u20$as$u20$core..fmt..Display$GT$3fmt17hf06d594d26b2c655E $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h90d667b75783d2e8E $_ZN4core3ptr89drop_in_place$LT$std..io..Write..write_fmt..Adapter$LT$std..io..stdio..StderrLock$GT$$GT$17hcd5e79da3f92767bE $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17h846113e4f2abcc3dE $_ZN4core3fmt5Write10write_char17h8fc7d1480738044bE $_ZN4core3fmt5Write9write_fmt17h22fbf674e3ba7d8eE $_ZN4core3ptr88drop_in_place$LT$std..io..Write..write_fmt..Adapter$LT$alloc..vec..Vec$LT$u8$GT$$GT$$GT$17h04373aee67a077a9E.llvm.9660907189867844885 $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17ha64215833ac6d838E $_ZN4core3fmt5Write10write_char17hc89cc9fd0af3e181E $_ZN4core3fmt5Write9write_fmt17h11b5748d5310bc97E $_ZN4core3ptr88drop_in_place$LT$std..io..Write..write_fmt..Adapter$LT$alloc..vec..Vec$LT$u8$GT$$GT$$GT$17h04373aee67a077a9E $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$i32$GT$3fmt17h0d225e8f6f3c78c6E $_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17hfb89e3d6c2568f08E.1 $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h3bceb8e6c5131c36E.1 $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h52d87c11c795cdddE.3 $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17had9e027a1aa3b2ccE.3 $_ZN4core3ptr28drop_in_place$LT$$RF$str$GT$17h800211bd58f2cc07E.1 $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17h232c2c2ffc092594E $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17h2d0fadd3ac8bb5afE $_ZN4core3ptr77drop_in_place$LT$std..panicking..begin_panic_handler..FormatStringPayload$GT$17ha4b1fec6326a7cf9E $_ZN102_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17heffe0194a79480cdE $_ZN102_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17h978c60e35d9b2e5fE $_ZN4core3ptr205drop_in_place$LT$$LT$alloc..boxed..Box$LT$dyn$u20$core..error..Error$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$u20$as$u20$core..convert..From$LT$alloc..string..String$GT$$GT$..from..StringError$GT$17h2008b045d902326fE $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h52d87c11c795cdddE.4 $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17had9e027a1aa3b2ccE.4 $_ZN4core3fmt5Write9write_fmt17hed59aef0e547cad5E $_ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17h3fa5012f7cea22daE $_ZN53_$LT$core..fmt..Error$u20$as$u20$core..fmt..Debug$GT$3fmt17haf1074f0f9151d42E.1 $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h347df457801b2e1fE $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h52d87c11c795cdddE.5 $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17had9e027a1aa3b2ccE.5 $_ZN4core3ops8function6FnOnce9call_once17hc6d1905079f8f33bE.llvm.16891890523046555270 $_ZN4core3ptr88drop_in_place$LT$core..panic..panic_info..PanicInfo..internal_constructor..NoPayload$GT$17hbcc9e157a10fdfcaE $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h0a105c0c144e43f9E $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h3311e449c4f06445E $_ZN63_$LT$core..cell..BorrowMutError$u20$as$u20$core..fmt..Debug$GT$3fmt17h7b6815a6f9ee6c49E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h7444cfe9f847f71eE)
  (data $.tdata "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
  (data $.rodata "\0a\00\00\00\18\00\10\00\00\00\00\00\18\00\10\00\01\00\00\00\02\00\00\00\0c\00\00\00\04\00\00\00\03\00\00\00\04\00\00\00\05\00\00\00\09\00\00\00\0c\00\00\00\04\00\00\00\0a\00\00\00\0b\00\00\00\05\00\00\00a Display implementation returned an error unexpectedly\00\0c\00\00\00\00\00\00\00\01\00\00\00\0d\00\00\00/home/lara/.rustup/toolchains/nightly-2024-03-16-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/alloc/src/string.rs\00\00\a4\00\10\00z\00\00\00\fa\09\00\00\0e\00\00\00Error\00\00\00\0c\00\00\00\00\00\00\00\01\00\00\00\0e\00\00\00\0f\00\00\00\0f\00\00\00Hi!\0aP\01\10\00\04\00\00\00Booting into HoneyOSBoot completed!\000\01\10\00\00\00\00\00                                                    \0a.-..-.                         .--.  .--.   Developed by GetAGripGal\0a: :; :                        : ,. :: .--'  ---------------------------\0a:    : .--. ,-.,-. .--. .-..-.: :: :`. `.   Welcome to HoneyOS!\0a: :: :' .; :: ,. :' '_.': :; :: :; : _`, :  ---------------------------\0a:_;:_;`.__.':_;:_;`.__.'`._. ;`.__.'`.__.'  \0a                         .-. :\0a                         `._.'\0a\00\00\00\88\01\10\00\b5\01\00\00Bootloader ptr: H\03\10\00\10\00\00\00Bootloader pid: `\03\10\00\10\00\00\00Settup en environment: []\00\00\000\01\10\00\00\00\00\00\90\03\10\00\01\00\00\00 *\00\000\01\10\00\00\00\00\000\01\10\00\00\00\00\00\10\00\00\00\0c\00\00\00\04\00\00\00\11\00\00\00\12\00\00\00\13\00\00\00cannot modify the panic hook from a panicking thread\d0\03\10\004\00\00\00/home/lara/.rustup/toolchains/nightly-2024-03-16-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/std/src/panicking.rs\00\0c\04\10\00{\00\00\00\87\00\00\00\09\00\00\00\0c\04\10\00{\00\00\00\84\02\00\00\1e\00\00\00\10\00\00\00\0c\00\00\00\04\00\00\00\14\00\00\00\15\00\00\00\08\00\00\00\04\00\00\00\16\00\00\00\17\00\00\00\00\00\00\00\01\00\00\00\18\00\00\00memory allocation of  bytes failed\00\00\d8\04\10\00\15\00\00\00\ed\04\10\00\0d\00\00\00/home/lara/.rustup/toolchains/nightly-2024-03-16-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/std/src/alloc.rs\00\0c\05\10\00w\00\00\00b\01\00\00\09\00\00\00/home/lara/.rustup/toolchains/nightly-2024-03-16-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/std/src/sync/once.rs\00\94\05\10\00{\00\00\00\d0\00\00\00\14\00\00\00\94\05\10\00{\00\00\00\d0\00\00\001\00\00\00lock count overflow in reentrant mutex/home/lara/.rustup/toolchains/nightly-2024-03-16-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/std/src/sync/reentrant_lock.rs\00V\06\10\00\85\00\00\00\bc\00\00\00-\00\00\00internal error: entered unreachable code: state is never set to invalid values\00\00\ec\06\10\00N\00\00\00too many active read locks on RwLockD\07\10\00$\00\00\00/home/lara/.rustup/toolchains/nightly-2024-03-16-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/std/src/sys/sync/rwlock/futex.rs\00p\07\10\00\87\00\00\00{\00\00\00\11\00\00\00assertion failed: is_unlocked(state)p\07\10\00\87\00\00\00\e7\00\00\00\09\00\00\00/home/lara/.rustup/toolchains/nightly-2024-03-16-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/std/src/io/buffered/linewritershim.rsmid > len\00\00\00\c8\08\10\00\09\00\00\00<\08\10\00\8c\00\00\00\0a\01\00\00)\00\00\00/home/lara/.rustup/toolchains/nightly-2024-03-16-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/std/src/io/stdio.rs\00\00\ec\08\10\00z\00\00\00\22\03\00\00\14\00\00\00failed printing to : \00\00\00x\09\10\00\13\00\00\00\8b\09\10\00\02\00\00\00\ec\08\10\00z\00\00\00@\04\00\00\09\00\00\00stdoutformatter error\00\00\00\b6\09\10\00\0f\00\00\00(\00\00\00\1c\00\00\00\0c\00\00\00\04\00\00\00\1d\00\00\00\1e\00\00\00\1f\00\00\00 \00\00\00\0c\00\00\00\04\00\00\00!\00\00\00\22\00\00\00#\00\00\00$\00\00\00\0c\00\00\00\04\00\00\00!\00\00\00\22\00\00\00#\00\00\00$\00\00\00\0c\00\00\00\04\00\00\00\1d\00\00\00\1e\00\00\00\1f\00\00\00entity not foundpermission deniedconnection refusedconnection resethost unreachablenetwork unreachableconnection abortednot connectedaddress in useaddress not availablenetwork downbroken pipeentity already existsoperation would blocknot a directoryis a directorydirectory not emptyread-only filesystem or storage mediumfilesystem loop or indirection limit (e.g. symlink loop)stale network file handleinvalid input parameterinvalid datatimed outwrite zerono storage spaceseek on unseekable filefilesystem quota exceededfile too largeresource busyexecutable file busydeadlockcross-device link or renametoo many linksinvalid filenameargument list too longoperation interruptedunsupportedunexpected end of fileout of memoryother erroruncategorized error (os error )\00\00\004\0a\10\00\00\00\00\00!\0d\10\00\0b\00\00\00,\0d\10\00\01\00\00\004\0a\10\00\00\00\00\00\10\00\00\00\11\00\00\00\12\00\00\00\10\00\00\00\10\00\00\00\13\00\00\00\12\00\00\00\0d\00\00\00\0e\00\00\00\15\00\00\00\0c\00\00\00\0b\00\00\00\15\00\00\00\15\00\00\00\0f\00\00\00\0e\00\00\00\13\00\00\00&\00\00\008\00\00\00\19\00\00\00\17\00\00\00\0c\00\00\00\09\00\00\00\0a\00\00\00\10\00\00\00\17\00\00\00\19\00\00\00\0e\00\00\00\0d\00\00\00\14\00\00\00\08\00\00\00\1b\00\00\00\0e\00\00\00\10\00\00\00\16\00\00\00\15\00\00\00\0b\00\00\00\16\00\00\00\0d\00\00\00\0b\00\00\00\13\00\00\004\0a\10\00D\0a\10\00U\0a\10\00g\0a\10\00w\0a\10\00\87\0a\10\00\9a\0a\10\00\ac\0a\10\00\b9\0a\10\00\c7\0a\10\00\dc\0a\10\00\e8\0a\10\00\f3\0a\10\00\08\0b\10\00\1d\0b\10\00,\0b\10\00:\0b\10\00M\0b\10\00s\0b\10\00\ab\0b\10\00\c4\0b\10\00\db\0b\10\00\e7\0b\10\00\f0\0b\10\00\fa\0b\10\00\0a\0c\10\00!\0c\10\00:\0c\10\00H\0c\10\00U\0c\10\00i\0c\10\00q\0c\10\00\8c\0c\10\00\9a\0c\10\00\aa\0c\10\00\c0\0c\10\00\d5\0c\10\00\e0\0c\10\00\f6\0c\10\00\03\0d\10\00\0e\0d\10\00/home/lara/.cargo/registry/src/index.crates.io-6f17d22bba15001f/dlmalloc-0.2.6/src/dlmalloc.rsassertion failed: psize >= size + min_overhead\98\0e\10\00^\00\00\00\a8\04\00\00\09\00\00\00assertion failed: psize <= size + max_overhead\00\00\98\0e\10\00^\00\00\00\ae\04\00\00\0d\00\00\00'\00\00\00\0c\00\00\00\04\00\00\00(\00\00\00)\00\00\00\13\00\00\00operation successful*\00\00\00\08\00\00\00\04\00\00\00\16\00\00\00*\00\00\00\08\00\00\00\04\00\00\00+\00\00\00,\00\00\00-\00\00\00\10\00\00\00\04\00\00\00.\00\00\00/\00\00\00Error\00\00\000\00\00\00\0c\00\00\00\04\00\00\001\00\00\002\00\00\003\00\00\00a formatting trait implementation returned an error\004\00\00\00\00\00\00\00\01\00\00\005\00\00\00/home/lara/.rustup/toolchains/nightly-2024-03-16-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/alloc/src/fmt.rs\00<\10\10\00w\00\00\00y\02\00\00 \00\00\006\00\00\00\0c\00\00\00\04\00\00\007\00\00\008\00\00\003\00\00\00\ef\bf\bd\00capacity overflow\00\00\00\e0\10\10\00\11\00\00\00/home/lara/.rustup/toolchains/nightly-2024-03-16-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/alloc/src/raw_vec.rs\00\fc\10\10\00{\00\00\00\19\00\00\00\05\00\00\0000010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899:\00\00\00\00\00\00\00\01\00\00\00;\00\00\00/home/lara/.rustup/toolchains/nightly-2024-03-16-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/slice/memchr.rs\00`\12\10\00\7f\00\00\00\83\00\00\00\1e\00\00\00`\12\10\00\7f\00\00\00\9f\00\00\00\09\00\00\00panicked at :\0a\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\04\04\04\04\04\00\00\00\00\00\00\00\00\00\00\00\00\00BorrowMutErroralready borrowed: \1e\14\10\00\12\00\00\00called `Option::unwrap()` on a `None` value\00\10\14\10\00\00\00\00\00: \00\00\10\14\10\00\00\00\00\00l\14\10\00\02\00\00\00range start index  out of range for slice of length \80\14\10\00\12\00\00\00\92\14\10\00\22\00\00\00range end index \c4\14\10\00\10\00\00\00\92\14\10\00\22\00\00\00:\00\00\00\e4\14\10\00\00\00\00\00\e4\14\10\00\01\00\00\00\e4\14\10\00\01\00\00\00"))
(module $bootloader.wasm
  (type (;0;) (func (param i32)))
  (type (;1;) (func (param i32 i32)))
  (type (;2;) (func (param i32 i32) (result i32)))
  (type (;3;) (func (param i32 i32 i32) (result i32)))
  (type (;4;) (func (result i32)))
  (type (;5;) (func))
  (type (;6;) (func (param i32 i32 i32)))
  (type (;7;) (func (param i32 i32 i32 i32)))
  (type (;8;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;9;) (func (param i32 i32 i32 i32 i32 i32)))
  (type (;10;) (func (param i32) (result i32)))
  (type (;11;) (func (param i64 i32)))
  (type (;12;) (func (param i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;13;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;14;) (func (param i64 i32 i32) (result i32)))
  (type (;15;) (func (param i32 i32 i32 i32 i32)))
  (type (;16;) (func (param i32 i64 i64 i64 i64)))
  (import "env" "memory" (memory (;0;) 17 16384 shared))
  (import "hapi" "stdout_write" (func $_ZN4hapi3ffi12stdout_write17h71e5f9014c1d9a4fE (type 1)))
  (import "hapi" "pid" (func $_ZN4hapi3ffi3pid17he3ddf86caef2352aE (type 4)))
  (import "hapi" "stdout_clear" (func $_ZN4hapi3ffi12stdout_clear17h40e2d6e05c9fd14fE (type 5)))
  (import "hapi" "stdout_clear_line" (func $_ZN4hapi3ffi17stdout_clear_line17hf10351ebe06015e4E (type 5)))
  (func $__wasm_init_tls (type 0) (param i32)
    local.get 0
    global.set $__tls_base
    local.get 0
    i32.const 0
    i32.const 24
    memory.init $.tdata)
  (func $__wasm_init_memory (type 5)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          i32.const 1054476
          i32.const 0
          i32.const 1
          i32.atomic.rmw.cmpxchg
          br_table 0 (;@3;) 1 (;@2;) 2 (;@1;)
        end
        i32.const 1048576
        i32.const 1048576
        global.set $__tls_base
        i32.const 0
        i32.const 24
        memory.init $.tdata
        i32.const 1048600
        i32.const 0
        i32.const 5352
        memory.init $.rodata
        i32.const 1053952
        i32.const 0
        i32.const 524
        memory.fill
        i32.const 1054476
        i32.const 2
        i32.atomic.store
        i32.const 1054476
        i32.const -1
        memory.atomic.notify
        drop
        br 1 (;@1;)
      end
      i32.const 1054476
      i32.const 1
      i64.const -1
      memory.atomic.wait32
      drop
    end
    data.drop $.rodata)
  (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hcdd6221b2f2b34a3E (type 2) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    local.get 1
    call $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h88408237604245e2E)
  (func $_ZN4core3fmt5Write9write_fmt17ha9ac37fb789f75c0E (type 2) (param i32 i32) (result i32)
    local.get 0
    i32.const 1048620
    local.get 1
    call $_ZN4core3fmt5write17h55b62ec8489b4effE)
  (func $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17hed41479ee867d133E (type 0) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end)
  (func $_ZN4hapi6stdout7writeln17hda9dfccb5411cdcaE (type 0) (param i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 8
    i32.add
    local.get 0
    call $_ZN60_$LT$alloc..string..String$u20$as$u20$core..clone..Clone$GT$5clone17h6b93b50df1762922E
    local.get 1
    i32.const 2
    i32.store offset=36
    local.get 1
    i32.const 1048604
    i32.store offset=32
    local.get 1
    i64.const 1
    i64.store offset=44 align=4
    local.get 1
    i32.const 1
    i32.store offset=60
    local.get 1
    local.get 1
    i32.const 56
    i32.add
    i32.store offset=40
    local.get 1
    local.get 1
    i32.const 8
    i32.add
    i32.store offset=56
    local.get 1
    i32.const 20
    i32.add
    local.get 1
    i32.const 32
    i32.add
    call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
    local.get 1
    i32.load offset=20
    local.set 0
    local.get 1
    i32.load offset=24
    local.tee 2
    local.get 1
    i32.load offset=28
    call $_ZN4hapi3ffi12stdout_write17h71e5f9014c1d9a4fE
    block  ;; label = @1
      local.get 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 0
      i32.const 1
      call $__rust_dealloc
    end
    block  ;; label = @1
      local.get 1
      i32.load offset=8
      local.tee 0
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=12
      local.get 0
      i32.const 1
      call $__rust_dealloc
    end
    local.get 1
    i32.const 64
    i32.add
    global.set $__stack_pointer)
  (func $_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17hfb89e3d6c2568f08E.llvm.12628461014352780869 (type 2) (param i32 i32) (result i32)
    local.get 0
    i32.load offset=4
    local.get 0
    i32.load offset=8
    local.get 1
    call $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h88408237604245e2E)
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17had9e027a1aa3b2ccE (type 2) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const 0
            i32.store offset=12
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            block  ;; label = @5
              local.get 1
              i32.const 65536
              i32.ge_u
              br_if 0 (;@5;)
              local.get 2
              local.get 1
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=14
              local.get 2
              local.get 1
              i32.const 12
              i32.shr_u
              i32.const 224
              i32.or
              i32.store8 offset=12
              local.get 2
              local.get 1
              i32.const 6
              i32.shr_u
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=13
              i32.const 3
              local.set 1
              br 3 (;@2;)
            end
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=15
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            local.get 2
            local.get 1
            i32.const 18
            i32.shr_u
            i32.const 7
            i32.and
            i32.const 240
            i32.or
            i32.store8 offset=12
            i32.const 4
            local.set 1
            br 2 (;@2;)
          end
          block  ;; label = @4
            local.get 0
            i32.load offset=8
            local.tee 3
            local.get 0
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 0
            local.get 3
            call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17hd674caba485a4a52E
            local.get 0
            i32.load offset=8
            local.set 3
          end
          local.get 0
          local.get 3
          i32.const 1
          i32.add
          i32.store offset=8
          local.get 0
          i32.load offset=4
          local.get 3
          i32.add
          local.get 1
          i32.store8
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=13
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 1
      end
      block  ;; label = @2
        local.get 0
        i32.load
        local.get 0
        i32.load offset=8
        local.tee 3
        i32.sub
        local.get 1
        i32.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.get 3
        local.get 1
        call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h9c43c6db2a98d9e5E.llvm.12628461014352780869
        local.get 0
        i32.load offset=8
        local.set 3
      end
      local.get 0
      i32.load offset=4
      local.get 3
      i32.add
      local.get 2
      i32.const 12
      i32.add
      local.get 1
      memory.copy
      local.get 0
      local.get 3
      local.get 1
      i32.add
      i32.store offset=8
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    i32.const 0)
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17hd674caba485a4a52E (type 1) (param i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load
      local.tee 3
      i32.const 1
      i32.shl
      local.tee 4
      local.get 1
      local.get 4
      local.get 1
      i32.gt_u
      select
      local.tee 1
      i32.const 8
      local.get 1
      i32.const 8
      i32.gt_u
      select
      local.tee 1
      i32.const -1
      i32.xor
      i32.const 31
      i32.shr_u
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          i32.const 0
          local.set 3
          br 1 (;@2;)
        end
        local.get 2
        local.get 3
        i32.store offset=28
        local.get 2
        local.get 0
        i32.load offset=4
        i32.store offset=20
        i32.const 1
        local.set 3
      end
      local.get 2
      local.get 3
      i32.store offset=24
      local.get 2
      i32.const 8
      i32.add
      local.get 4
      local.get 1
      local.get 2
      i32.const 20
      i32.add
      call $_ZN5alloc7raw_vec11finish_grow17h2e3cd82ff91598e4E.llvm.12628461014352780869
      block  ;; label = @2
        local.get 2
        i32.load offset=8
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.load offset=12
        local.tee 0
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 2
        i32.load offset=16
        call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
        unreachable
      end
      local.get 2
      i32.load offset=12
      local.set 3
      local.get 0
      local.get 1
      i32.store
      local.get 0
      local.get 3
      i32.store offset=4
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    call $_ZN5alloc7raw_vec17capacity_overflow17h45f3b19af45ec27bE
    unreachable)
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h9c43c6db2a98d9e5E.llvm.12628461014352780869 (type 6) (param i32 i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      local.get 2
      i32.add
      local.tee 2
      local.get 1
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 1
      local.set 4
      local.get 0
      i32.load
      local.tee 5
      i32.const 1
      i32.shl
      local.tee 1
      local.get 2
      local.get 1
      local.get 2
      i32.gt_u
      select
      local.tee 1
      i32.const 8
      local.get 1
      i32.const 8
      i32.gt_u
      select
      local.tee 1
      i32.const -1
      i32.xor
      i32.const 31
      i32.shr_u
      local.set 2
      block  ;; label = @2
        block  ;; label = @3
          local.get 5
          br_if 0 (;@3;)
          i32.const 0
          local.set 4
          br 1 (;@2;)
        end
        local.get 3
        local.get 5
        i32.store offset=28
        local.get 3
        local.get 0
        i32.load offset=4
        i32.store offset=20
      end
      local.get 3
      local.get 4
      i32.store offset=24
      local.get 3
      i32.const 8
      i32.add
      local.get 2
      local.get 1
      local.get 3
      i32.const 20
      i32.add
      call $_ZN5alloc7raw_vec11finish_grow17h2e3cd82ff91598e4E.llvm.12628461014352780869
      block  ;; label = @2
        local.get 3
        i32.load offset=8
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        i32.load offset=12
        local.tee 0
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 3
        i32.load offset=16
        call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
        unreachable
      end
      local.get 3
      i32.load offset=12
      local.set 2
      local.get 0
      local.get 1
      i32.store
      local.get 0
      local.get 2
      i32.store offset=4
      local.get 3
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    call $_ZN5alloc7raw_vec17capacity_overflow17h45f3b19af45ec27bE
    unreachable)
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h52d87c11c795cdddE (type 3) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.get 0
      i32.load offset=8
      local.tee 3
      i32.sub
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 2
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h9c43c6db2a98d9e5E.llvm.12628461014352780869
      local.get 0
      i32.load offset=8
      local.set 3
    end
    local.get 0
    i32.load offset=4
    local.get 3
    i32.add
    local.get 1
    local.get 2
    memory.copy
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0)
  (func $_ZN5alloc7raw_vec11finish_grow17h2e3cd82ff91598e4E.llvm.12628461014352780869 (type 7) (param i32 i32 i32 i32)
    (local i32 i32 i32)
    i32.const 1
    local.set 4
    i32.const 0
    local.set 5
    i32.const 4
    local.set 6
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.load offset=4
                i32.eqz
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 3
                  i32.load offset=8
                  local.tee 4
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 2
                    br_if 0 (;@8;)
                    i32.const 1
                    local.set 4
                    br 4 (;@4;)
                  end
                  i32.const 0
                  i32.load8_u offset=1053953
                  drop
                  local.get 2
                  i32.const 1
                  call $__rust_alloc
                  local.set 4
                  br 2 (;@5;)
                end
                local.get 3
                i32.load
                local.get 4
                i32.const 1
                local.get 2
                call $__rust_realloc
                local.set 4
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 2
                br_if 0 (;@6;)
                i32.const 1
                local.set 4
                br 2 (;@4;)
              end
              i32.const 0
              i32.load8_u offset=1053953
              drop
              local.get 2
              i32.const 1
              call $__rust_alloc
              local.set 4
            end
            local.get 4
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 0
          local.get 4
          i32.store offset=4
          i32.const 0
          local.set 4
          br 1 (;@2;)
        end
        i32.const 1
        local.set 4
        local.get 0
        i32.const 1
        i32.store offset=4
      end
      i32.const 8
      local.set 6
      local.get 2
      local.set 5
    end
    local.get 0
    local.get 6
    i32.add
    local.get 5
    i32.store
    local.get 0
    local.get 4
    i32.store)
  (func $_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17hbd22de30bea3fa42E (type 1) (param i32 i32)
    local.get 1
    local.get 1
    call $_ZN10bootloader6_start28_$u7b$$u7b$closure$u7d$$u7d$17h7bcceeaf4923263bE)
  (func $_ZN10bootloader6_start28_$u7b$$u7b$closure$u7d$$u7d$17h7bcceeaf4923263bE (type 1) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 0
    i32.store offset=40
    local.get 2
    i64.const 4294967296
    i64.store offset=32 align=4
    local.get 2
    i32.const 3
    i32.store8 offset=76
    local.get 2
    i32.const 32
    i32.store offset=60
    local.get 2
    i32.const 0
    i32.store offset=72
    local.get 2
    i32.const 1048644
    i32.store offset=68
    local.get 2
    i32.const 0
    i32.store offset=52
    local.get 2
    i32.const 0
    i32.store offset=44
    local.get 2
    local.get 2
    i32.const 32
    i32.add
    i32.store offset=64
    block  ;; label = @1
      local.get 1
      local.get 2
      i32.const 44
      i32.add
      call $_ZN73_$LT$core..panic..panic_info..PanicInfo$u20$as$u20$core..fmt..Display$GT$3fmt17hbb48b73a4a2a8746E
      br_if 0 (;@1;)
      local.get 2
      i32.const 8
      i32.add
      i32.const 8
      i32.add
      local.get 2
      i32.const 32
      i32.add
      i32.const 8
      i32.add
      i32.load
      i32.store
      local.get 2
      local.get 2
      i64.load offset=32 align=4
      i64.store offset=8
      local.get 2
      i32.const 6
      i32.store offset=28
      local.get 2
      local.get 2
      i32.const 8
      i32.add
      i32.store offset=24
      local.get 2
      i64.const 1
      i64.store offset=56 align=4
      local.get 2
      i32.const 1
      i32.store offset=48
      local.get 2
      i32.const 1048960
      i32.store offset=44
      local.get 2
      local.get 2
      i32.const 24
      i32.add
      i32.store offset=52
      local.get 2
      i32.const 32
      i32.add
      local.get 2
      i32.const 44
      i32.add
      call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
      local.get 2
      i32.const 32
      i32.add
      call $_ZN4hapi6stdout7writeln17hda9dfccb5411cdcaE
      block  ;; label = @2
        local.get 2
        i32.load offset=32
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.load offset=36
        local.get 1
        i32.const 1
        call $__rust_dealloc
      end
      block  ;; label = @2
        local.get 2
        i32.load offset=8
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.load offset=12
        local.get 1
        i32.const 1
        call $__rust_dealloc
      end
      local.get 2
      i32.const 80
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 1048668
    i32.const 55
    local.get 2
    i32.const 8
    i32.add
    i32.const 1048724
    i32.const 1048864
    call $_ZN4core6result13unwrap_failed17ha1a4a677361ebda3E
    unreachable)
  (func $_ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17ha872a7de228e8298E (type 0) (param i32))
  (func $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17hed41479ee867d133E.1 (type 0) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end)
  (func $_ZN53_$LT$core..fmt..Error$u20$as$u20$core..fmt..Debug$GT$3fmt17haf1074f0f9151d42E (type 2) (param i32 i32) (result i32)
    local.get 1
    i32.const 1048880
    i32.const 5
    call $_ZN4core3fmt9Formatter9write_str17h1fe892ce632ffc37E)
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17had9e027a1aa3b2ccE.1 (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const 0
            i32.store offset=12
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            block  ;; label = @5
              local.get 1
              i32.const 65536
              i32.ge_u
              br_if 0 (;@5;)
              local.get 2
              local.get 1
              i32.const 12
              i32.shr_u
              i32.const 224
              i32.or
              i32.store8 offset=12
              local.get 2
              local.get 1
              i32.const 6
              i32.shr_u
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=13
              i32.const 3
              local.set 3
              i32.const 2
              local.set 4
              br 3 (;@2;)
            end
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            local.get 2
            local.get 1
            i32.const 18
            i32.shr_u
            i32.const 7
            i32.and
            i32.const 240
            i32.or
            i32.store8 offset=12
            i32.const 4
            local.set 3
            i32.const 3
            local.set 4
            br 2 (;@2;)
          end
          block  ;; label = @4
            local.get 0
            i32.load offset=8
            local.tee 3
            local.get 0
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 0
            local.get 3
            call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17hd674caba485a4a52E
            local.get 0
            i32.load offset=8
            local.set 3
          end
          local.get 0
          i32.load offset=4
          local.get 3
          i32.add
          local.get 1
          i32.store8
          local.get 0
          local.get 0
          i32.load offset=8
          i32.const 1
          i32.add
          i32.store offset=8
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 3
        i32.const 1
        local.set 4
      end
      local.get 2
      i32.const 12
      i32.add
      local.get 4
      i32.or
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8
      block  ;; label = @2
        local.get 0
        i32.load
        local.get 0
        i32.load offset=8
        local.tee 1
        i32.sub
        local.get 3
        i32.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        local.get 3
        call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h9c43c6db2a98d9e5E.llvm.12628461014352780869
        local.get 0
        i32.load offset=8
        local.set 1
      end
      local.get 0
      i32.load offset=4
      local.get 1
      i32.add
      local.get 2
      i32.const 12
      i32.add
      local.get 3
      memory.copy
      local.get 0
      local.get 1
      local.get 3
      i32.add
      i32.store offset=8
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    i32.const 0)
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h52d87c11c795cdddE.1 (type 3) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.get 0
      i32.load offset=8
      local.tee 3
      i32.sub
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 2
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h9c43c6db2a98d9e5E.llvm.12628461014352780869
      local.get 0
      i32.load offset=8
      local.set 3
    end
    local.get 0
    i32.load offset=4
    local.get 3
    i32.add
    local.get 1
    local.get 2
    memory.copy
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0)
  (func $_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17hfb89e3d6c2568f08E (type 2) (param i32 i32) (result i32)
    local.get 0
    i32.load offset=4
    local.get 0
    i32.load offset=8
    local.get 1
    call $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h88408237604245e2E)
  (func $_start (type 5)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 96
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    i32.const 1
    i32.const 1048888
    call $_ZN3std9panicking8set_hook17h6212d5852e6eeda7E
    local.get 0
    i32.const 1
    i32.store offset=76
    local.get 0
    i32.const 1048916
    i32.store offset=72
    local.get 0
    i64.const 0
    i64.store offset=84 align=4
    local.get 0
    i32.const 1048880
    i32.store offset=80
    local.get 0
    i32.const 72
    i32.add
    call $_ZN3std2io5stdio6_print17h12d72242e7805467E
    i32.const 0
    i32.load8_u offset=1053953
    drop
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          i32.const 20
          i32.const 1
          call $__rust_alloc
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.const 16
          i32.add
          i32.const 0
          i32.load offset=1048940 align=1
          i32.store align=1
          local.get 1
          i32.const 8
          i32.add
          i32.const 0
          i64.load offset=1048932 align=1
          i64.store align=1
          local.get 1
          i32.const 0
          i64.load offset=1048924 align=1
          i64.store align=1
          local.get 0
          i32.const 20
          i32.store offset=80
          local.get 0
          local.get 1
          i32.store offset=76
          local.get 0
          i32.const 20
          i32.store offset=72
          local.get 0
          i32.const 72
          i32.add
          call $_ZN4hapi6stdout7writeln17hda9dfccb5411cdcaE
          block  ;; label = @4
            local.get 0
            i32.load offset=72
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.load offset=76
            local.get 1
            i32.const 1
            call $__rust_dealloc
          end
          i32.const 0
          local.set 1
          loop  ;; label = @4
            i32.const 0
            i32.load8_u offset=1053953
            drop
            i32.const 24
            i32.const 1
            call $__rust_alloc
            local.tee 2
            i32.eqz
            br_if 2 (;@2;)
            local.get 2
            i32.const 16
            i32.add
            i32.const 0
            i64.load offset=1049480 align=1
            i64.store align=1
            local.get 2
            i32.const 8
            i32.add
            i32.const 0
            i64.load offset=1049472 align=1
            i64.store align=1
            local.get 2
            i32.const 0
            i64.load offset=1049464 align=1
            i64.store align=1
            local.get 0
            i32.const 24
            i32.store offset=56
            local.get 0
            local.get 2
            i32.store offset=52
            local.get 0
            i32.const 24
            i32.store offset=48
            local.get 0
            i32.const 1049509
            i32.store offset=64
            local.get 0
            i32.const 1
            i32.store offset=68
            local.get 0
            i32.const 2
            i32.store offset=76
            local.get 0
            i32.const 1049512
            i32.store offset=72
            local.get 0
            i64.const 2
            i64.store offset=84 align=4
            local.get 0
            i32.const 7
            i32.store offset=32
            local.get 0
            i32.const 6
            i32.store offset=24
            local.get 0
            local.get 0
            i32.const 20
            i32.add
            i32.store offset=80
            local.get 0
            local.get 0
            i32.const 64
            i32.add
            i32.store offset=28
            local.get 0
            local.get 0
            i32.const 48
            i32.add
            i32.store offset=20
            local.get 0
            i32.const 8
            i32.add
            local.get 0
            i32.const 72
            i32.add
            call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
            block  ;; label = @5
              local.get 0
              i32.load offset=48
              local.tee 2
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=52
              local.get 2
              i32.const 1
              call $__rust_dealloc
            end
            local.get 0
            i32.const 48
            i32.add
            i32.const 8
            i32.add
            local.tee 2
            local.get 0
            i32.const 8
            i32.add
            i32.const 8
            i32.add
            local.tee 3
            i32.load
            i32.store
            local.get 0
            local.get 0
            i64.load offset=8 align=4
            i64.store offset=48
            local.get 0
            i32.const 1
            i32.store offset=68
            local.get 0
            i32.const 1049509
            i32.const 1049508
            local.get 1
            select
            i32.store offset=64
            local.get 0
            i32.const 2
            i32.store offset=76
            local.get 0
            i32.const 1049512
            i32.store offset=72
            local.get 0
            i64.const 2
            i64.store offset=84 align=4
            local.get 0
            i32.const 7
            i32.store offset=32
            local.get 0
            i32.const 6
            i32.store offset=24
            local.get 0
            local.get 0
            i32.const 20
            i32.add
            i32.store offset=80
            local.get 0
            local.get 0
            i32.const 64
            i32.add
            i32.store offset=28
            local.get 0
            local.get 0
            i32.const 48
            i32.add
            i32.store offset=20
            local.get 0
            i32.const 8
            i32.add
            local.get 0
            i32.const 72
            i32.add
            call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
            block  ;; label = @5
              local.get 0
              i32.load offset=48
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=52
              local.get 4
              i32.const 1
              call $__rust_dealloc
            end
            local.get 2
            local.get 3
            i32.load
            i32.store
            local.get 0
            local.get 0
            i64.load offset=8 align=4
            i64.store offset=48
            local.get 0
            i32.const 1
            i32.store offset=68
            local.get 0
            i32.const 1049508
            i32.const 1049509
            local.get 1
            i32.const 2
            i32.lt_u
            select
            i32.store offset=64
            local.get 0
            i32.const 2
            i32.store offset=76
            local.get 0
            i32.const 1049512
            i32.store offset=72
            local.get 0
            i64.const 2
            i64.store offset=84 align=4
            local.get 0
            i32.const 7
            i32.store offset=32
            local.get 0
            i32.const 6
            i32.store offset=24
            local.get 0
            local.get 0
            i32.const 20
            i32.add
            i32.store offset=80
            local.get 0
            local.get 0
            i32.const 64
            i32.add
            i32.store offset=28
            local.get 0
            local.get 0
            i32.const 48
            i32.add
            i32.store offset=20
            local.get 0
            i32.const 8
            i32.add
            local.get 0
            i32.const 72
            i32.add
            call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
            block  ;; label = @5
              local.get 0
              i32.load offset=48
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=52
              local.get 4
              i32.const 1
              call $__rust_dealloc
            end
            local.get 2
            local.get 3
            i32.load
            i32.store
            local.get 0
            local.get 0
            i64.load offset=8 align=4
            i64.store offset=48
            local.get 0
            i32.const 1
            i32.store offset=68
            local.get 0
            i32.const 1049508
            i32.const 1049509
            local.get 1
            i32.const 3
            i32.lt_u
            select
            i32.store offset=64
            local.get 0
            i32.const 2
            i32.store offset=76
            local.get 0
            i32.const 1049512
            i32.store offset=72
            local.get 0
            i64.const 2
            i64.store offset=84 align=4
            local.get 0
            i32.const 7
            i32.store offset=32
            local.get 0
            i32.const 6
            i32.store offset=24
            local.get 0
            local.get 0
            i32.const 20
            i32.add
            i32.store offset=80
            local.get 0
            local.get 0
            i32.const 64
            i32.add
            i32.store offset=28
            local.get 0
            local.get 0
            i32.const 48
            i32.add
            i32.store offset=20
            local.get 0
            i32.const 8
            i32.add
            local.get 0
            i32.const 72
            i32.add
            call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
            block  ;; label = @5
              local.get 0
              i32.load offset=48
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=52
              local.get 4
              i32.const 1
              call $__rust_dealloc
            end
            local.get 2
            local.get 3
            i32.load
            i32.store
            local.get 0
            local.get 0
            i64.load offset=8 align=4
            i64.store offset=48
            local.get 0
            i32.const 1
            i32.store offset=68
            local.get 0
            i32.const 1049508
            i32.const 1049509
            local.get 1
            i32.const 4
            i32.lt_u
            select
            i32.store offset=64
            local.get 0
            i32.const 2
            i32.store offset=76
            local.get 0
            i32.const 1049512
            i32.store offset=72
            local.get 0
            i64.const 2
            i64.store offset=84 align=4
            local.get 0
            i32.const 7
            i32.store offset=32
            local.get 0
            i32.const 6
            i32.store offset=24
            local.get 0
            local.get 0
            i32.const 20
            i32.add
            i32.store offset=80
            local.get 0
            local.get 0
            i32.const 64
            i32.add
            i32.store offset=28
            local.get 0
            local.get 0
            i32.const 48
            i32.add
            i32.store offset=20
            local.get 0
            i32.const 8
            i32.add
            local.get 0
            i32.const 72
            i32.add
            call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
            block  ;; label = @5
              local.get 0
              i32.load offset=48
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=52
              local.get 4
              i32.const 1
              call $__rust_dealloc
            end
            local.get 2
            local.get 3
            i32.load
            i32.store
            local.get 0
            local.get 0
            i64.load offset=8 align=4
            i64.store offset=48
            local.get 0
            i32.const 1
            i32.store offset=68
            local.get 0
            i32.const 1049508
            i32.const 1049509
            local.get 1
            i32.const 5
            i32.lt_u
            select
            i32.store offset=64
            local.get 0
            i32.const 2
            i32.store offset=76
            local.get 0
            i32.const 1049512
            i32.store offset=72
            local.get 0
            i64.const 2
            i64.store offset=84 align=4
            local.get 0
            i32.const 7
            i32.store offset=32
            local.get 0
            i32.const 6
            i32.store offset=24
            local.get 0
            local.get 0
            i32.const 20
            i32.add
            i32.store offset=80
            local.get 0
            local.get 0
            i32.const 64
            i32.add
            i32.store offset=28
            local.get 0
            local.get 0
            i32.const 48
            i32.add
            i32.store offset=20
            local.get 0
            i32.const 8
            i32.add
            local.get 0
            i32.const 72
            i32.add
            call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
            block  ;; label = @5
              local.get 0
              i32.load offset=48
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=52
              local.get 4
              i32.const 1
              call $__rust_dealloc
            end
            local.get 2
            local.get 3
            i32.load
            i32.store
            local.get 0
            local.get 0
            i64.load offset=8 align=4
            i64.store offset=48
            local.get 0
            i32.const 1
            i32.store offset=68
            local.get 0
            i32.const 1049508
            i32.const 1049509
            local.get 1
            i32.const 6
            i32.lt_u
            select
            i32.store offset=64
            local.get 0
            i32.const 2
            i32.store offset=76
            local.get 0
            i32.const 1049512
            i32.store offset=72
            local.get 0
            i64.const 2
            i64.store offset=84 align=4
            local.get 0
            i32.const 7
            i32.store offset=32
            local.get 0
            i32.const 6
            i32.store offset=24
            local.get 0
            local.get 0
            i32.const 20
            i32.add
            i32.store offset=80
            local.get 0
            local.get 0
            i32.const 64
            i32.add
            i32.store offset=28
            local.get 0
            local.get 0
            i32.const 48
            i32.add
            i32.store offset=20
            local.get 0
            i32.const 8
            i32.add
            local.get 0
            i32.const 72
            i32.add
            call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
            block  ;; label = @5
              local.get 0
              i32.load offset=48
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=52
              local.get 4
              i32.const 1
              call $__rust_dealloc
            end
            local.get 2
            local.get 3
            i32.load
            i32.store
            local.get 0
            local.get 0
            i64.load offset=8 align=4
            i64.store offset=48
            local.get 0
            i32.const 1
            i32.store offset=68
            local.get 0
            i32.const 1049508
            i32.const 1049509
            local.get 1
            i32.const 7
            i32.lt_u
            select
            i32.store offset=64
            local.get 0
            i32.const 2
            i32.store offset=76
            local.get 0
            i32.const 1049512
            i32.store offset=72
            local.get 0
            i64.const 2
            i64.store offset=84 align=4
            local.get 0
            i32.const 7
            i32.store offset=32
            local.get 0
            i32.const 6
            i32.store offset=24
            local.get 0
            local.get 0
            i32.const 20
            i32.add
            i32.store offset=80
            local.get 0
            local.get 0
            i32.const 64
            i32.add
            i32.store offset=28
            local.get 0
            local.get 0
            i32.const 48
            i32.add
            i32.store offset=20
            local.get 0
            i32.const 8
            i32.add
            local.get 0
            i32.const 72
            i32.add
            call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
            block  ;; label = @5
              local.get 0
              i32.load offset=48
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=52
              local.get 4
              i32.const 1
              call $__rust_dealloc
            end
            local.get 2
            local.get 3
            i32.load
            i32.store
            local.get 0
            local.get 0
            i64.load offset=8 align=4
            i64.store offset=48
            local.get 0
            i32.const 1
            i32.store offset=68
            local.get 0
            i32.const 1049508
            i32.const 1049509
            local.get 1
            i32.const 8
            i32.lt_u
            select
            i32.store offset=64
            local.get 0
            i32.const 2
            i32.store offset=76
            local.get 0
            i32.const 1049512
            i32.store offset=72
            local.get 0
            i64.const 2
            i64.store offset=84 align=4
            local.get 0
            i32.const 7
            i32.store offset=32
            local.get 0
            i32.const 6
            i32.store offset=24
            local.get 0
            local.get 0
            i32.const 20
            i32.add
            i32.store offset=80
            local.get 0
            local.get 0
            i32.const 64
            i32.add
            i32.store offset=28
            local.get 0
            local.get 0
            i32.const 48
            i32.add
            i32.store offset=20
            local.get 0
            i32.const 8
            i32.add
            local.get 0
            i32.const 72
            i32.add
            call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
            block  ;; label = @5
              local.get 0
              i32.load offset=48
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=52
              local.get 4
              i32.const 1
              call $__rust_dealloc
            end
            local.get 2
            local.get 3
            i32.load
            i32.store
            local.get 0
            local.get 0
            i64.load offset=8 align=4
            i64.store offset=48
            local.get 0
            i32.const 1
            i32.store offset=68
            local.get 0
            i32.const 1049508
            i32.const 1049509
            local.get 1
            i32.const 9
            i32.lt_u
            select
            i32.store offset=64
            local.get 0
            i32.const 2
            i32.store offset=76
            local.get 0
            i32.const 1049512
            i32.store offset=72
            local.get 0
            i64.const 2
            i64.store offset=84 align=4
            local.get 0
            i32.const 7
            i32.store offset=32
            local.get 0
            i32.const 6
            i32.store offset=24
            local.get 0
            local.get 0
            i32.const 20
            i32.add
            i32.store offset=80
            local.get 0
            local.get 0
            i32.const 64
            i32.add
            i32.store offset=28
            local.get 0
            local.get 0
            i32.const 48
            i32.add
            i32.store offset=20
            local.get 0
            i32.const 8
            i32.add
            local.get 0
            i32.const 72
            i32.add
            call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
            block  ;; label = @5
              local.get 0
              i32.load offset=48
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=52
              local.get 4
              i32.const 1
              call $__rust_dealloc
            end
            local.get 2
            local.get 3
            i32.load
            i32.store
            local.get 0
            local.get 0
            i64.load offset=8 align=4
            i64.store offset=48
            local.get 0
            i32.const 2
            i32.store offset=76
            local.get 0
            i32.const 1049492
            i32.store offset=72
            local.get 0
            i64.const 1
            i64.store offset=84 align=4
            local.get 0
            i32.const 6
            i32.store offset=24
            local.get 0
            local.get 0
            i32.const 20
            i32.add
            i32.store offset=80
            local.get 0
            local.get 0
            i32.const 48
            i32.add
            i32.store offset=20
            local.get 0
            i32.const 36
            i32.add
            local.get 0
            i32.const 72
            i32.add
            call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
            block  ;; label = @5
              local.get 0
              i32.load offset=48
              local.tee 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=52
              local.get 3
              i32.const 1
              call $__rust_dealloc
            end
            local.get 2
            local.get 0
            i32.const 36
            i32.add
            i32.const 8
            i32.add
            i32.load
            i32.store
            local.get 0
            local.get 0
            i64.load offset=36 align=4
            i64.store offset=48
            local.get 0
            i32.const 6
            i32.store offset=68
            local.get 0
            local.get 0
            i32.const 48
            i32.add
            i32.store offset=64
            local.get 0
            i64.const 1
            i64.store offset=84 align=4
            local.get 0
            i32.const 1
            i32.store offset=76
            local.get 0
            i32.const 1048960
            i32.store offset=72
            local.get 0
            local.get 0
            i32.const 64
            i32.add
            i32.store offset=80
            local.get 0
            i32.const 20
            i32.add
            local.get 0
            i32.const 72
            i32.add
            call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
            local.get 0
            i32.const 20
            i32.add
            call $_ZN4hapi6stdout7writeln17hda9dfccb5411cdcaE
            block  ;; label = @5
              local.get 0
              i32.load offset=20
              local.tee 2
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=24
              local.get 2
              i32.const 1
              call $__rust_dealloc
            end
            i64.const 0
            i32.const 500000000
            call $_ZN3std6thread5sleep17he7bace389a782edbE
            call $_ZN4hapi6stdout10clear_line17h5f8170283428f215E
            block  ;; label = @5
              local.get 0
              i32.load offset=48
              local.tee 2
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              i32.load offset=52
              local.get 2
              i32.const 1
              call $__rust_dealloc
            end
            local.get 1
            i32.const 1
            i32.add
            local.tee 1
            i32.const 10
            i32.ne
            br_if 0 (;@4;)
          end
          i32.const 0
          i32.load8_u offset=1053953
          drop
          i32.const 15
          i32.const 1
          call $__rust_alloc
          local.tee 1
          i32.eqz
          br_if 2 (;@1;)
          local.get 1
          i32.const 7
          i32.add
          i32.const 0
          i64.load offset=1048951 align=1
          i64.store align=1
          local.get 1
          i32.const 0
          i64.load offset=1048944 align=1
          i64.store align=1
          local.get 0
          i32.const 15
          i32.store offset=80
          local.get 0
          local.get 1
          i32.store offset=76
          local.get 0
          i32.const 15
          i32.store offset=72
          local.get 0
          i32.const 72
          i32.add
          call $_ZN4hapi6stdout7writeln17hda9dfccb5411cdcaE
          local.get 1
          i32.const 15
          i32.const 1
          call $__rust_dealloc
          call $_ZN4hapi6stdout5clear17h9a156d15f20c9155E
          local.get 0
          i32.const 7
          i32.store offset=52
          local.get 0
          i32.const 1049408
          i32.store offset=48
          local.get 0
          i64.const 1
          i64.store offset=84 align=4
          local.get 0
          i32.const 1
          i32.store offset=76
          local.get 0
          i32.const 1048960
          i32.store offset=72
          local.get 0
          local.get 0
          i32.const 48
          i32.add
          i32.store offset=80
          local.get 0
          i32.const 20
          i32.add
          local.get 0
          i32.const 72
          i32.add
          call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
          local.get 0
          i32.const 20
          i32.add
          call $_ZN4hapi6stdout7writeln17hda9dfccb5411cdcaE
          block  ;; label = @4
            local.get 0
            i32.load offset=20
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.load offset=24
            local.get 1
            i32.const 1
            call $__rust_dealloc
          end
          call $_ZN4hapi3ffi3pid17he3ddf86caef2352aE
          local.set 1
          local.get 0
          i32.const 8
          i32.store offset=52
          local.get 0
          local.get 1
          i32.store offset=64
          local.get 0
          local.get 0
          i32.const 64
          i32.add
          i32.store offset=48
          local.get 0
          i64.const 1
          i64.store offset=84 align=4
          local.get 0
          i32.const 1
          i32.store offset=76
          local.get 0
          i32.const 1049432
          i32.store offset=72
          local.get 0
          local.get 0
          i32.const 48
          i32.add
          i32.store offset=80
          local.get 0
          i32.const 20
          i32.add
          local.get 0
          i32.const 72
          i32.add
          call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
          local.get 0
          i32.const 20
          i32.add
          call $_ZN4hapi6stdout7writeln17hda9dfccb5411cdcaE
          block  ;; label = @4
            local.get 0
            i32.load offset=20
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.load offset=24
            local.get 1
            i32.const 1
            call $__rust_dealloc
          end
          local.get 0
          i32.const 20
          i32.add
          call $_ZN4hapi7process3pid17hf9b3007209ca1b6aE
          local.get 0
          i32.const 6
          i32.store offset=68
          local.get 0
          local.get 0
          i32.const 20
          i32.add
          i32.store offset=64
          local.get 0
          i64.const 1
          i64.store offset=84 align=4
          local.get 0
          i32.const 1
          i32.store offset=76
          local.get 0
          i32.const 1049456
          i32.store offset=72
          local.get 0
          local.get 0
          i32.const 64
          i32.add
          i32.store offset=80
          local.get 0
          i32.const 48
          i32.add
          local.get 0
          i32.const 72
          i32.add
          call $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E
          local.get 0
          i32.const 48
          i32.add
          call $_ZN4hapi6stdout7writeln17hda9dfccb5411cdcaE
          block  ;; label = @4
            local.get 0
            i32.load offset=48
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.load offset=52
            local.get 1
            i32.const 1
            call $__rust_dealloc
          end
          block  ;; label = @4
            local.get 0
            i32.load offset=20
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.load offset=24
            local.get 1
            i32.const 1
            call $__rust_dealloc
          end
          local.get 0
          i32.const 96
          i32.add
          global.set $__stack_pointer
          return
        end
        i32.const 1
        i32.const 20
        call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
        unreachable
      end
      i32.const 1
      i32.const 24
      call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
      unreachable
    end
    i32.const 1
    i32.const 15
    call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
    unreachable)
  (func $__rust_alloc (type 2) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    local.get 1
    call $__rdl_alloc
    local.set 2
    local.get 2
    return)
  (func $__rust_dealloc (type 6) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call $__rdl_dealloc
    return)
  (func $__rust_realloc (type 8) (param i32 i32 i32 i32) (result i32)
    (local i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $__rdl_realloc
    local.set 4
    local.get 4
    return)
  (func $__rust_alloc_error_handler (type 1) (param i32 i32)
    local.get 0
    local.get 1
    call $__rg_oom
    return)
  (func $_ZN4hapi7process3pid17hf9b3007209ca1b6aE (type 0) (param i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 4
    i32.add
    call $_ZN4hapi3ffi3pid17he3ddf86caef2352aE
    i32.const 36
    call $_ZN5alloc6string6String15from_utf8_lossy17h847cec55033f5fe5E
    local.get 1
    i32.load offset=8
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load offset=12
            local.tee 3
            br_if 0 (;@4;)
            i32.const 1
            local.set 4
            br 1 (;@3;)
          end
          local.get 3
          i32.const 0
          i32.lt_s
          br_if 1 (;@2;)
          i32.const 0
          i32.load8_u offset=1053953
          drop
          local.get 3
          i32.const 1
          call $__rust_alloc
          local.tee 4
          i32.eqz
          br_if 2 (;@1;)
        end
        local.get 4
        local.get 2
        local.get 3
        memory.copy
        local.get 0
        local.get 3
        i32.store offset=8
        local.get 0
        local.get 4
        i32.store offset=4
        local.get 0
        local.get 3
        i32.store
        block  ;; label = @3
          local.get 1
          i32.load offset=4
          local.tee 3
          i32.const -2147483648
          i32.or
          i32.const -2147483648
          i32.eq
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          i32.const 1
          call $__rust_dealloc
        end
        local.get 1
        i32.const 16
        i32.add
        global.set $__stack_pointer
        return
      end
      call $_ZN5alloc7raw_vec17capacity_overflow17h45f3b19af45ec27bE
      unreachable
    end
    i32.const 1
    local.get 3
    call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
    unreachable)
  (func $_ZN4hapi6stdout5clear17h9a156d15f20c9155E (type 5)
    call $_ZN4hapi3ffi12stdout_clear17h40e2d6e05c9fd14fE)
  (func $_ZN4hapi6stdout10clear_line17h5f8170283428f215E (type 5)
    call $_ZN4hapi3ffi17stdout_clear_line17hf10351ebe06015e4E)
  (func $_ZN4core3ptr28drop_in_place$LT$$RF$str$GT$17h800211bd58f2cc07E (type 0) (param i32))
  (func $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h3bceb8e6c5131c36E (type 0) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end)
  (func $_ZN4core3ptr88drop_in_place$LT$core..panic..panic_info..PanicInfo..internal_constructor..NoPayload$GT$17h2ef38da117d3f36eE.llvm.13317409777152324161 (type 0) (param i32))
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17had9e027a1aa3b2ccE.2 (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const 0
            i32.store offset=12
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            block  ;; label = @5
              local.get 1
              i32.const 65536
              i32.ge_u
              br_if 0 (;@5;)
              local.get 2
              local.get 1
              i32.const 12
              i32.shr_u
              i32.const 224
              i32.or
              i32.store8 offset=12
              local.get 2
              local.get 1
              i32.const 6
              i32.shr_u
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=13
              i32.const 3
              local.set 3
              i32.const 2
              local.set 4
              br 3 (;@2;)
            end
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            local.get 2
            local.get 1
            i32.const 18
            i32.shr_u
            i32.const 7
            i32.and
            i32.const 240
            i32.or
            i32.store8 offset=12
            i32.const 4
            local.set 3
            i32.const 3
            local.set 4
            br 2 (;@2;)
          end
          block  ;; label = @4
            local.get 0
            i32.load offset=8
            local.tee 3
            local.get 0
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 0
            local.get 3
            call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17h322ca40853dbe2e1E
            local.get 0
            i32.load offset=8
            local.set 3
          end
          local.get 0
          i32.load offset=4
          local.get 3
          i32.add
          local.get 1
          i32.store8
          local.get 0
          local.get 0
          i32.load offset=8
          i32.const 1
          i32.add
          i32.store offset=8
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 3
        i32.const 1
        local.set 4
      end
      local.get 2
      i32.const 12
      i32.add
      local.get 4
      i32.or
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8
      block  ;; label = @2
        local.get 0
        i32.load
        local.get 0
        i32.load offset=8
        local.tee 1
        i32.sub
        local.get 3
        i32.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        local.get 3
        call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17ha8d8870fa1fd559bE
        local.get 0
        i32.load offset=8
        local.set 1
      end
      local.get 0
      i32.load offset=4
      local.get 1
      i32.add
      local.get 2
      i32.const 12
      i32.add
      local.get 3
      memory.copy
      local.get 0
      local.get 1
      local.get 3
      i32.add
      i32.store offset=8
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    i32.const 0)
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h52d87c11c795cdddE.2 (type 3) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.get 0
      i32.load offset=8
      local.tee 3
      i32.sub
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 2
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17ha8d8870fa1fd559bE
      local.get 0
      i32.load offset=8
      local.set 3
    end
    local.get 0
    i32.load offset=4
    local.get 3
    i32.add
    local.get 1
    local.get 2
    memory.copy
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0)
  (func $_ZN3std9panicking8set_hook17h6212d5852e6eeda7E (type 1) (param i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        i32.atomic.load offset=1054472
        i32.const 2147483647
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        call $_ZN3std9panicking11panic_count17is_zero_slow_path17h69ec01d9f0b5341bE
        i32.eqz
        br_if 1 (;@1;)
      end
      block  ;; label = @2
        i32.const 0
        i32.const 0
        i32.const 1073741823
        i32.atomic.rmw.cmpxchg offset=1053956
        i32.eqz
        br_if 0 (;@2;)
        i32.const 1053956
        call $_ZN3std3sys4sync6rwlock5futex6RwLock15write_contended17h49ac51d1758efb0dE
      end
      i32.const 0
      i32.load offset=1053968
      local.set 3
      i32.const 0
      local.get 1
      i32.store offset=1053968
      i32.const 0
      i32.load offset=1053964
      local.set 1
      i32.const 0
      local.get 0
      i32.store offset=1053964
      block  ;; label = @2
        i32.const 0
        i32.const 1073741823
        i32.atomic.rmw.sub offset=1053956
        i32.const -1073741823
        i32.add
        local.tee 0
        i32.const 1073741824
        i32.lt_u
        br_if 0 (;@2;)
        i32.const 1053956
        local.get 0
        call $_ZN3std3sys4sync6rwlock5futex6RwLock22wake_writer_or_readers17hb4a20ca5745bab1cE
      end
      block  ;; label = @2
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 3
        i32.load
        call_indirect (type 0)
        local.get 3
        i32.load offset=4
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 0
        local.get 3
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    local.get 2
    i32.const 1
    i32.store offset=12
    local.get 2
    i32.const 1049604
    i32.store offset=8
    local.get 2
    i64.const 0
    i64.store offset=20 align=4
    local.get 2
    i32.const 1049528
    i32.store offset=16
    local.get 2
    i32.const 8
    i32.add
    i32.const 1049736
    call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
    unreachable)
  (func $rust_begin_unwind (type 0) (param i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      local.tee 2
      br_if 0 (;@1;)
      i32.const 1049752
      call $_ZN4core6option13unwrap_failed17h7da440408d6f3f41E
      unreachable
    end
    local.get 1
    local.get 0
    i32.load offset=12
    i32.store offset=12
    local.get 1
    local.get 0
    i32.store offset=8
    local.get 1
    local.get 2
    i32.store offset=4
    local.get 1
    i32.const 4
    i32.add
    call $_ZN3std10sys_common9backtrace26__rust_end_short_backtrace17hefc9a3e6e4a3ff8aE
    unreachable)
  (func $_ZN102_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17heffe0194a79480cdE (type 1) (param i32 i32)
    (local i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      i32.load
      i32.const -2147483648
      i32.ne
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=12
      local.set 3
      local.get 2
      i32.const 36
      i32.add
      i32.const 8
      i32.add
      local.tee 4
      i32.const 0
      i32.store
      local.get 2
      i64.const 4294967296
      i64.store offset=36 align=4
      local.get 2
      i32.const 36
      i32.add
      i32.const 1049528
      local.get 3
      call $_ZN4core3fmt5write17h55b62ec8489b4effE
      drop
      local.get 2
      i32.const 24
      i32.add
      i32.const 8
      i32.add
      local.get 4
      i32.load
      local.tee 3
      i32.store
      local.get 2
      local.get 2
      i64.load offset=36 align=4
      local.tee 5
      i64.store offset=24
      local.get 1
      i32.const 8
      i32.add
      local.get 3
      i32.store
      local.get 1
      local.get 5
      i64.store align=4
    end
    local.get 1
    i64.load align=4
    local.set 5
    local.get 1
    i64.const 4294967296
    i64.store align=4
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.tee 3
    local.get 1
    i32.const 8
    i32.add
    local.tee 1
    i32.load
    i32.store
    local.get 1
    i32.const 0
    i32.store
    i32.const 0
    i32.load8_u offset=1053953
    drop
    local.get 2
    local.get 5
    i64.store offset=8
    block  ;; label = @1
      i32.const 12
      i32.const 4
      call $__rust_alloc
      local.tee 1
      br_if 0 (;@1;)
      i32.const 4
      i32.const 12
      call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
      unreachable
    end
    local.get 1
    local.get 2
    i64.load offset=8
    i64.store align=4
    local.get 1
    i32.const 8
    i32.add
    local.get 3
    i32.load
    i32.store
    local.get 0
    i32.const 1049768
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $_ZN102_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17h978c60e35d9b2e5fE (type 1) (param i32 i32)
    (local i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      i32.load
      i32.const -2147483648
      i32.ne
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=12
      local.set 3
      local.get 2
      i32.const 20
      i32.add
      i32.const 8
      i32.add
      local.tee 4
      i32.const 0
      i32.store
      local.get 2
      i64.const 4294967296
      i64.store offset=20 align=4
      local.get 2
      i32.const 20
      i32.add
      i32.const 1049528
      local.get 3
      call $_ZN4core3fmt5write17h55b62ec8489b4effE
      drop
      local.get 2
      i32.const 8
      i32.add
      i32.const 8
      i32.add
      local.get 4
      i32.load
      local.tee 3
      i32.store
      local.get 2
      local.get 2
      i64.load offset=20 align=4
      local.tee 5
      i64.store offset=8
      local.get 1
      i32.const 8
      i32.add
      local.get 3
      i32.store
      local.get 1
      local.get 5
      i64.store align=4
    end
    local.get 0
    i32.const 1049768
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17h232c2c2ffc092594E (type 1) (param i32 i32)
    (local i32 i32)
    i32.const 0
    i32.load8_u offset=1053953
    drop
    local.get 1
    i32.load offset=4
    local.set 2
    local.get 1
    i32.load
    local.set 3
    block  ;; label = @1
      i32.const 8
      i32.const 4
      call $__rust_alloc
      local.tee 1
      br_if 0 (;@1;)
      i32.const 4
      i32.const 8
      call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
      unreachable
    end
    local.get 1
    local.get 2
    i32.store offset=4
    local.get 1
    local.get 3
    i32.store
    local.get 0
    i32.const 1049784
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store)
  (func $_ZN3std9panicking20rust_panic_with_hook17h5d938c6f2f6345baE (type 9) (param i32 i32 i32 i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 6
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        i32.const 1
        i32.atomic.rmw.add offset=1054472
        i32.const 0
        i32.lt_s
        br_if 0 (;@2;)
        i32.const 0
        call $_ZN3std9panicking11panic_count17LOCAL_PANIC_COUNT7__getit17h1f4f26428983601aE.llvm.9857674224645661670
        local.tee 7
        i32.load8_u offset=4
        br_if 0 (;@2;)
        local.get 7
        i32.const 1
        i32.store8 offset=4
        local.get 7
        local.get 7
        i32.load
        i32.const 1
        i32.add
        i32.store
        local.get 6
        local.get 5
        i32.store8 offset=29
        local.get 6
        local.get 4
        i32.store8 offset=28
        local.get 6
        local.get 3
        i32.store offset=24
        local.get 6
        local.get 2
        i32.store offset=20
        local.get 6
        i32.const 1049800
        i32.store offset=16
        local.get 6
        i32.const 1049528
        i32.store offset=12
        block  ;; label = @3
          block  ;; label = @4
            i32.const 0
            i32.atomic.load offset=1053956
            local.tee 5
            i32.const 1073741821
            i32.gt_u
            br_if 0 (;@4;)
            i32.const 0
            local.get 5
            local.get 5
            i32.const 1
            i32.add
            i32.atomic.rmw.cmpxchg offset=1053956
            local.get 5
            i32.eq
            br_if 1 (;@3;)
          end
          i32.const 1053956
          call $_ZN3std3sys4sync6rwlock5futex6RwLock14read_contended17h31d44f8fba942917E
        end
        block  ;; label = @3
          i32.const 0
          i32.load offset=1053964
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          local.get 0
          local.get 1
          i32.load offset=16
          call_indirect (type 1)
          local.get 6
          local.get 6
          i64.load
          i64.store offset=12 align=4
          i32.const 0
          i32.load offset=1053964
          local.get 6
          i32.const 12
          i32.add
          i32.const 0
          i32.load offset=1053968
          i32.load offset=20
          call_indirect (type 1)
        end
        block  ;; label = @3
          i32.const 0
          i32.const 1
          i32.atomic.rmw.sub offset=1053956
          i32.const -1
          i32.add
          local.tee 6
          i32.const -1073741825
          i32.and
          i32.const -2147483648
          i32.ne
          br_if 0 (;@3;)
          i32.const 1053956
          local.get 6
          call $_ZN3std3sys4sync6rwlock5futex6RwLock22wake_writer_or_readers17hb4a20ca5745bab1cE
        end
        local.get 7
        i32.const 0
        i32.store8 offset=4
        local.get 4
        br_if 1 (;@1;)
      end
      unreachable
      unreachable
    end
    local.get 0
    local.get 1
    call $rust_panic
    unreachable)
  (func $rust_panic (type 1) (param i32 i32)
    local.get 0
    local.get 1
    call $__rust_start_panic
    drop
    unreachable
    unreachable)
  (func $_ZN3std2io8buffered9bufwriter18BufWriter$LT$W$GT$14write_all_cold17h71929ef15adfecaaE (type 7) (param i32 i32 i32 i32)
    (local i32 i32)
    local.get 1
    i32.load
    local.set 4
    block  ;; label = @1
      local.get 1
      i32.load offset=8
      local.tee 5
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      local.get 5
      i32.sub
      local.get 3
      i32.ge_u
      br_if 0 (;@1;)
      i32.const 0
      local.set 5
      local.get 1
      i32.const 0
      i32.store offset=8
      local.get 1
      i32.const 0
      i32.store8 offset=12
    end
    block  ;; label = @1
      local.get 4
      local.get 3
      i32.le_u
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=4
      local.get 5
      i32.add
      local.get 2
      local.get 3
      memory.copy
      local.get 0
      i32.const 4
      i32.store8
      local.get 1
      local.get 5
      local.get 3
      i32.add
      i32.store offset=8
      return
    end
    local.get 0
    i64.const 4
    i64.store align=4
    local.get 1
    i32.const 0
    i32.store8 offset=12)
  (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h90d667b75783d2e8E (type 2) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    local.get 1
    call $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h88408237604245e2E)
  (func $_ZN3std5alloc24default_alloc_error_hook17hb10cd7b0607bc6b3E (type 1) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      i32.const 0
      i32.load8_u offset=1053952
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const 2
      i32.store offset=16
      local.get 2
      i32.const 1049852
      i32.store offset=12
      local.get 2
      i64.const 1
      i64.store offset=24 align=4
      local.get 2
      i32.const 8
      i32.store offset=40
      local.get 2
      local.get 1
      i32.store offset=44
      local.get 2
      local.get 2
      i32.const 36
      i32.add
      i32.store offset=20
      local.get 2
      local.get 2
      i32.const 44
      i32.add
      i32.store offset=36
      local.get 2
      i32.const 12
      i32.add
      i32.const 1049988
      call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
      unreachable
    end
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $_ZN3std3sys12thread_local10fast_local12Key$LT$T$GT$14try_initialize17h47dc8302366a5cadE.llvm.11972105620972837968 (type 2) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    i32.const 0
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load8_u offset=8
          br_table 0 (;@3;) 1 (;@2;) 2 (;@1;) 0 (;@3;)
        end
        local.get 0
        i32.const 1
        i32.store8 offset=8
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          br_if 0 (;@3;)
          i32.const 0
          local.set 3
          br 1 (;@2;)
        end
        local.get 1
        i32.load
        local.set 3
        local.get 1
        i32.const 0
        i32.store
        local.get 1
        i32.load offset=4
        i32.const 0
        local.get 3
        select
        local.set 3
      end
      local.get 0
      i32.load offset=4
      local.set 1
      local.get 0
      local.get 3
      i32.store offset=4
      local.get 0
      i32.load
      local.set 3
      local.get 0
      i32.const 1
      i32.store
      local.get 2
      local.get 1
      i32.store offset=12
      local.get 2
      local.get 3
      i32.store offset=8
      block  ;; label = @2
        local.get 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.const 1
        i32.atomic.rmw.sub
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        atomic.fence
        local.get 2
        i32.const 8
        i32.add
        i32.const 4
        i32.add
        call $_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h272dc83cd57b5547E
      end
      local.get 0
      i32.const 4
      i32.add
      local.set 3
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 3)
  (func $__rg_oom (type 1) (param i32 i32)
    (local i32)
    local.get 1
    local.get 0
    i32.const 0
    i32.atomic.load offset=1053972
    local.tee 2
    i32.const 25
    local.get 2
    select
    call_indirect (type 1)
    unreachable
    unreachable)
  (func $_ZN3std3sys4sync5mutex5futex5Mutex14lock_contended17h21fa872088556641E (type 0) (param i32)
    (local i32 i32 i32)
    i32.const -100
    local.set 1
    block  ;; label = @1
      loop  ;; label = @2
        local.get 1
        local.set 2
        local.get 0
        i32.atomic.load
        local.tee 3
        i32.const 1
        i32.ne
        br_if 1 (;@1;)
        local.get 2
        i32.const 1
        i32.add
        local.set 1
        local.get 2
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        local.get 0
        i32.const 0
        i32.const 1
        i32.atomic.rmw.cmpxchg
        local.tee 3
        i32.eqz
        br_if 1 (;@1;)
      end
      loop  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 2
          i32.eq
          br_if 0 (;@3;)
          local.get 0
          i32.const 2
          i32.atomic.rmw.xchg
          i32.eqz
          br_if 2 (;@1;)
        end
        local.get 0
        i32.const 2
        i64.const -1
        memory.atomic.wait32
        drop
        i32.const -100
        local.set 2
        loop  ;; label = @3
          local.get 2
          local.tee 1
          i32.const 1
          i32.add
          local.set 2
          local.get 0
          i32.atomic.load
          local.tee 3
          i32.const 1
          i32.ne
          br_if 1 (;@2;)
          local.get 1
          i32.eqz
          br_if 1 (;@2;)
          br 0 (;@3;)
        end
      end
    end)
  (func $_ZN3std4sync9once_lock17OnceLock$LT$T$GT$10initialize17h904fea820818bbc3E (type 0) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 0
      i32.atomic.load offset=32
      i32.const 4
      i32.eq
      br_if 0 (;@1;)
      local.get 1
      local.get 0
      i32.store
      local.get 1
      local.get 1
      i32.const 15
      i32.add
      i32.store offset=4
      local.get 1
      local.get 1
      i32.store offset=8
      local.get 0
      i32.const 32
      i32.add
      local.get 1
      i32.const 8
      i32.add
      call $_ZN3std3sys4sync4once5futex4Once4call17h7fb705dc51f79757E.llvm.8846984551579673576
    end
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN3std3sys4sync4once5futex4Once4call17h7fb705dc51f79757E.llvm.8846984551579673576 (type 1) (param i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.atomic.load
        local.set 3
        block  ;; label = @3
          block  ;; label = @4
            loop  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 3
                        br_table 1 (;@9;) 1 (;@9;) 3 (;@7;) 6 (;@4;) 2 (;@8;) 0 (;@10;)
                      end
                      local.get 2
                      i32.const 1
                      i32.store offset=8
                      local.get 2
                      i32.const 1050428
                      i32.store offset=4
                      local.get 2
                      i64.const 0
                      i64.store offset=16 align=4
                      local.get 2
                      local.get 2
                      i32.const 28
                      i32.add
                      i32.store offset=12
                      local.get 2
                      i32.const 4
                      i32.add
                      i32.const 1050128
                      call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
                      unreachable
                    end
                    local.get 0
                    local.get 3
                    i32.const 2
                    i32.atomic.rmw.cmpxchg
                    local.tee 4
                    local.get 3
                    i32.ne
                    br_if 2 (;@6;)
                    local.get 1
                    i32.load
                    local.tee 4
                    i32.load
                    local.set 3
                    local.get 4
                    i32.const 0
                    i32.store
                    local.get 3
                    i32.eqz
                    br_if 5 (;@3;)
                    i32.const 0
                    i32.load8_u offset=1053953
                    drop
                    i32.const 1024
                    i32.const 1
                    call $__rust_alloc
                    local.tee 4
                    i32.eqz
                    br_if 7 (;@1;)
                    local.get 3
                    i64.const 0
                    i64.store align=4
                    local.get 3
                    i32.const 0
                    i32.store8 offset=28
                    local.get 3
                    i32.const 0
                    i32.store offset=24
                    local.get 3
                    local.get 4
                    i32.store offset=20
                    local.get 3
                    i32.const 1024
                    i32.store offset=16
                    local.get 3
                    i32.const 8
                    i32.add
                    i64.const 0
                    i64.store align=4
                    local.get 0
                    i32.const 4
                    i32.atomic.rmw.xchg
                    i32.const 3
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 0
                    i32.const 2147483647
                    memory.atomic.notify
                    drop
                  end
                  local.get 2
                  i32.const 32
                  i32.add
                  global.set $__stack_pointer
                  return
                end
                local.get 0
                i32.const 2
                i32.const 3
                i32.atomic.rmw.cmpxchg
                local.tee 4
                i32.const 2
                i32.eq
                br_if 2 (;@4;)
              end
              local.get 4
              local.set 3
              br 0 (;@5;)
            end
          end
          local.get 0
          i32.const 3
          i64.const -1
          memory.atomic.wait32
          drop
          br 1 (;@2;)
        end
      end
      i32.const 1050144
      call $_ZN4core6option13unwrap_failed17h7da440408d6f3f41E
      unreachable
    end
    i32.const 1
    i32.const 1024
    call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
    unreachable)
  (func $_ZN3std3sys4sync6rwlock5futex6RwLock14read_contended17h31d44f8fba942917E (type 0) (param i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    i32.const -100
    local.set 2
    block  ;; label = @1
      loop  ;; label = @2
        local.get 2
        local.set 3
        local.get 0
        i32.atomic.load
        local.tee 4
        i32.const 1073741823
        i32.ne
        br_if 1 (;@1;)
        local.get 3
        i32.const 1
        i32.add
        local.set 2
        local.get 3
        br_if 0 (;@2;)
      end
    end
    loop  ;; label = @1
      local.get 4
      i32.const 1073741823
      i32.and
      local.set 3
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 4
                i32.const 1073741823
                i32.gt_u
                br_if 0 (;@6;)
                local.get 3
                i32.const 1073741822
                i32.lt_u
                br_if 1 (;@5;)
              end
              local.get 3
              i32.const 1073741822
              i32.eq
              br_if 1 (;@4;)
              local.get 4
              i32.const 1073741824
              i32.and
              i32.eqz
              br_if 2 (;@3;)
              local.get 4
              local.set 3
              br 3 (;@2;)
            end
            local.get 0
            local.get 4
            local.get 4
            i32.const 1
            i32.add
            i32.atomic.rmw.cmpxchg
            local.tee 3
            local.get 4
            i32.ne
            local.set 2
            local.get 3
            local.set 4
            local.get 2
            br_if 3 (;@1;)
            local.get 1
            i32.const 32
            i32.add
            global.set $__stack_pointer
            return
          end
          local.get 1
          i32.const 1
          i32.store offset=12
          local.get 1
          i32.const 1050472
          i32.store offset=8
          local.get 1
          i64.const 0
          i64.store offset=20 align=4
          local.get 1
          i32.const 1050004
          i32.store offset=16
          local.get 1
          i32.const 8
          i32.add
          i32.const 1050616
          call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
          unreachable
        end
        local.get 0
        local.get 4
        local.get 4
        i32.const 1073741824
        i32.or
        local.tee 3
        i32.atomic.rmw.cmpxchg
        local.tee 2
        local.get 4
        i32.ne
        local.set 5
        local.get 2
        local.set 4
        local.get 5
        br_if 1 (;@1;)
      end
      local.get 0
      local.get 3
      i64.const -1
      memory.atomic.wait32
      drop
      i32.const -100
      local.set 3
      loop  ;; label = @2
        local.get 3
        local.tee 2
        i32.const 1
        i32.add
        local.set 3
        local.get 0
        i32.atomic.load
        local.tee 4
        i32.const 1073741823
        i32.ne
        br_if 1 (;@1;)
        local.get 2
        i32.eqz
        br_if 1 (;@1;)
        br 0 (;@2;)
      end
    end)
  (func $_ZN3std3sys4sync6rwlock5futex6RwLock15write_contended17h49ac51d1758efb0dE (type 0) (param i32)
    (local i32 i32 i32 i32 i32 i32)
    i32.const -100
    local.set 1
    block  ;; label = @1
      loop  ;; label = @2
        local.get 1
        local.set 2
        local.get 0
        i32.atomic.load
        local.tee 3
        i32.const 0
        i32.lt_s
        br_if 1 (;@1;)
        local.get 3
        i32.const 1073741823
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 2
        i32.const 1
        i32.add
        local.set 1
        local.get 2
        br_if 0 (;@2;)
      end
    end
    local.get 0
    i32.const 4
    i32.add
    local.set 4
    i32.const 1073741823
    local.set 5
    loop  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 1073741823
          i32.and
          br_if 0 (;@3;)
          local.get 0
          local.get 3
          local.get 3
          local.get 5
          i32.or
          i32.atomic.rmw.cmpxchg
          local.tee 2
          local.get 3
          i32.ne
          br_if 1 (;@2;)
          return
        end
        block  ;; label = @3
          local.get 3
          i32.const -1
          i32.le_s
          br_if 0 (;@3;)
          local.get 0
          local.get 3
          local.get 3
          i32.const -2147483648
          i32.or
          i32.atomic.rmw.cmpxchg
          local.tee 2
          local.get 3
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 0
        i32.atomic.load offset=4
        local.set 2
        i32.const -1073741825
        local.set 5
        local.get 0
        i32.atomic.load
        local.tee 3
        i32.const -1
        i32.gt_s
        br_if 1 (;@1;)
        local.get 3
        i32.const 1073741823
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        local.get 2
        i64.const -1
        memory.atomic.wait32
        drop
        i32.const -100
        local.set 2
        loop  ;; label = @3
          local.get 2
          local.tee 6
          i32.const 1
          i32.add
          local.set 2
          local.get 0
          i32.atomic.load
          local.tee 3
          i32.const 1073741823
          i32.and
          local.set 1
          local.get 3
          i32.const 0
          i32.lt_s
          br_if 2 (;@1;)
          local.get 1
          i32.eqz
          br_if 2 (;@1;)
          local.get 6
          i32.eqz
          br_if 2 (;@1;)
          br 0 (;@3;)
        end
      end
      local.get 2
      local.set 3
      br 0 (;@1;)
    end)
  (func $_ZN3std3sys4sync6rwlock5futex6RwLock22wake_writer_or_readers17hb4a20ca5745bab1cE (type 1) (param i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 1073741823
        i32.and
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 1
                i32.const -2147483648
                i32.ne
                br_if 0 (;@6;)
                local.get 0
                i32.const -2147483648
                i32.const 0
                i32.atomic.rmw.cmpxchg
                local.tee 1
                i32.const -2147483648
                i32.eq
                br_if 1 (;@5;)
              end
              local.get 1
              i32.const -1073741824
              i32.eq
              br_if 1 (;@4;)
              local.get 1
              i32.const 1073741824
              i32.ne
              br_if 4 (;@1;)
              br 2 (;@3;)
            end
            local.get 0
            i32.const 1
            i32.atomic.rmw.add offset=4
            drop
            local.get 0
            i32.const 1
            memory.atomic.notify offset=4
            drop
            br 3 (;@1;)
          end
          local.get 0
          i32.const -1073741824
          i32.const 1073741824
          i32.atomic.rmw.cmpxchg
          i32.const -1073741824
          i32.ne
          br_if 2 (;@1;)
          local.get 0
          i32.const 1
          i32.atomic.rmw.add offset=4
          drop
          local.get 0
          i32.const 1
          memory.atomic.notify offset=4
          br_if 2 (;@1;)
        end
        local.get 0
        i32.const 1073741824
        i32.const 0
        i32.atomic.rmw.cmpxchg
        i32.const 1073741824
        i32.ne
        br_if 1 (;@1;)
        local.get 0
        i32.const 2147483647
        memory.atomic.notify
        drop
        return
      end
      i32.const 1050632
      i32.const 36
      i32.const 1050668
      call $_ZN4core9panicking5panic17h5183d2125e960738E
      unreachable
    end)
  (func $_ZN3std4sync14reentrant_lock25current_thread_unique_ptr1X7__getit17ha3ae703d425817c5E.llvm.8846984551579673576 (type 10) (param i32) (result i32)
    global.get $__tls_base
    i32.const 0
    i32.add)
  (func $_ZN93_$LT$std..io..buffered..linewritershim..LineWriterShim$LT$W$GT$$u20$as$u20$std..io..Write$GT$9write_all17h06beff25007fa475E (type 7) (param i32 i32 i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    i32.const 10
    local.get 2
    local.get 3
    call $_ZN4core5slice6memchr7memrchr17h0f954a0b5e3b458fE
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 4
          i32.load
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.load
              local.tee 5
              i32.const 8
              i32.add
              i32.load
              local.tee 1
              br_if 0 (;@5;)
              i32.const 0
              local.set 1
              br 1 (;@4;)
            end
            local.get 1
            local.get 5
            i32.const 4
            i32.add
            i32.load
            i32.add
            i32.const -1
            i32.add
            i32.load8_u
            i32.const 10
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            local.set 1
            local.get 5
            i32.const 0
            i32.store8 offset=12
            local.get 5
            i32.const 8
            i32.add
            i32.const 0
            i32.store
          end
          block  ;; label = @4
            local.get 5
            i32.load
            local.get 1
            i32.sub
            local.get 3
            i32.gt_u
            br_if 0 (;@4;)
            local.get 0
            local.get 5
            local.get 2
            local.get 3
            call $_ZN3std2io8buffered9bufwriter18BufWriter$LT$W$GT$14write_all_cold17h71929ef15adfecaaE
            br 2 (;@2;)
          end
          local.get 5
          i32.load offset=4
          local.get 1
          i32.add
          local.get 2
          local.get 3
          memory.copy
          local.get 0
          i32.const 4
          i32.store8
          local.get 5
          i32.const 8
          i32.add
          local.get 1
          local.get 3
          i32.add
          i32.store
          br 1 (;@2;)
        end
        local.get 3
        local.get 4
        i32.load offset=4
        i32.const 1
        i32.add
        local.tee 5
        i32.lt_u
        br_if 1 (;@1;)
        block  ;; label = @3
          local.get 1
          i32.load
          local.tee 1
          i32.const 8
          i32.add
          i32.load
          local.tee 6
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.load
              local.get 6
              i32.sub
              local.get 5
              i32.le_u
              br_if 0 (;@5;)
              local.get 1
              i32.const 4
              i32.add
              i32.load
              local.get 6
              i32.add
              local.get 2
              local.get 5
              memory.copy
              local.get 1
              i32.const 8
              i32.add
              local.get 6
              local.get 5
              i32.add
              local.tee 6
              i32.store
              br 1 (;@4;)
            end
            local.get 4
            i32.const 8
            i32.add
            local.get 1
            local.get 2
            local.get 5
            call $_ZN3std2io8buffered9bufwriter18BufWriter$LT$W$GT$14write_all_cold17h71929ef15adfecaaE
            block  ;; label = @5
              local.get 4
              i32.load8_u offset=8
              i32.const 4
              i32.eq
              br_if 0 (;@5;)
              local.get 0
              local.get 4
              i64.load offset=8
              i64.store align=4
              br 3 (;@2;)
            end
            local.get 1
            i32.const 8
            i32.add
            i32.load
            local.set 6
          end
          local.get 6
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          i32.const 0
          i32.store8 offset=12
          local.get 1
          i32.const 8
          i32.add
          i32.const 0
          i32.store
        end
        local.get 2
        local.get 5
        i32.add
        local.set 2
        block  ;; label = @3
          local.get 1
          i32.load
          local.get 3
          local.get 5
          i32.sub
          local.tee 3
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          local.get 2
          local.get 3
          call $_ZN3std2io8buffered9bufwriter18BufWriter$LT$W$GT$14write_all_cold17h71929ef15adfecaaE
          br 1 (;@2;)
        end
        local.get 1
        i32.const 4
        i32.add
        i32.load
        local.get 2
        local.get 3
        memory.copy
        local.get 0
        i32.const 4
        i32.store8
        local.get 1
        i32.const 8
        i32.add
        local.get 3
        i32.store
      end
      local.get 4
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    local.get 4
    i32.const 1
    i32.store offset=12
    local.get 4
    i32.const 1050836
    i32.store offset=8
    local.get 4
    i64.const 0
    i64.store offset=20 align=4
    local.get 4
    i32.const 1050684
    i32.store offset=16
    local.get 4
    i32.const 8
    i32.add
    i32.const 1050844
    call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
    unreachable)
  (func $_ZN4core3ptr89drop_in_place$LT$std..io..Write..write_fmt..Adapter$LT$std..io..stdio..StderrLock$GT$$GT$17hcd5e79da3f92767bE (type 0) (param i32)
    (local i32 i32 i32)
    local.get 0
    i32.load offset=4
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load8_u
        local.tee 0
        i32.const 4
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 3
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 1
      i32.load
      local.tee 2
      local.get 1
      i32.const 4
      i32.add
      i32.load
      local.tee 0
      i32.load
      call_indirect (type 0)
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        local.get 0
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 1
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end)
  (func $_ZN61_$LT$$RF$std..io..stdio..Stdout$u20$as$u20$std..io..Write$GT$9write_fmt17h811d540b6973f862E (type 6) (param i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          call $_ZN3std4sync14reentrant_lock25current_thread_unique_ptr1X7__getit17ha3ae703d425817c5E.llvm.8846984551579673576
          local.tee 4
          local.get 1
          i32.load
          i32.load
          local.tee 1
          i32.atomic.load offset=4
          i32.eq
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 1
            i32.const 0
            i32.const 1
            i32.atomic.rmw.cmpxchg
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            call $_ZN3std3sys4sync5mutex5futex5Mutex14lock_contended17h21fa872088556641E
          end
          local.get 1
          local.get 4
          i32.atomic.store offset=4
          local.get 1
          i32.const 1
          i32.store offset=8
          br 1 (;@2;)
        end
        local.get 1
        i32.load offset=8
        i32.const 1
        i32.add
        local.tee 4
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        local.get 4
        i32.store offset=8
      end
      local.get 3
      local.get 1
      i32.store offset=12
      local.get 3
      i32.const 4
      i32.store8 offset=16
      local.get 3
      local.get 3
      i32.const 12
      i32.add
      i32.store offset=24
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.const 16
            i32.add
            i32.const 1051092
            local.get 2
            call $_ZN4core3fmt5write17h55b62ec8489b4effE
            i32.eqz
            br_if 0 (;@4;)
            local.get 3
            i32.load8_u offset=16
            i32.const 4
            i32.ne
            br_if 1 (;@3;)
            local.get 0
            i32.const 1051080
            i32.store offset=4
            local.get 0
            i32.const 2
            i32.store8
            br 2 (;@2;)
          end
          local.get 0
          i32.const 4
          i32.store8
          local.get 3
          i32.load offset=20
          local.set 0
          block  ;; label = @4
            local.get 3
            i32.load8_u offset=16
            local.tee 1
            i32.const 4
            i32.gt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 3
            i32.ne
            br_if 2 (;@2;)
          end
          local.get 0
          i32.load
          local.tee 2
          local.get 0
          i32.const 4
          i32.add
          i32.load
          local.tee 1
          i32.load
          call_indirect (type 0)
          block  ;; label = @4
            local.get 1
            i32.load offset=4
            local.tee 4
            i32.eqz
            br_if 0 (;@4;)
            local.get 2
            local.get 4
            local.get 1
            i32.load offset=8
            call $__rust_dealloc
          end
          local.get 0
          i32.const 12
          i32.const 4
          call $__rust_dealloc
          br 1 (;@2;)
        end
        local.get 0
        local.get 3
        i64.load offset=16
        i64.store align=4
      end
      local.get 3
      i32.load offset=12
      local.tee 1
      local.get 1
      i32.load offset=8
      i32.const -1
      i32.add
      local.tee 0
      i32.store offset=8
      block  ;; label = @2
        local.get 0
        br_if 0 (;@2;)
        local.get 1
        i32.const 0
        i32.atomic.store offset=4
        local.get 1
        i32.const 0
        i32.atomic.rmw.xchg
        i32.const 2
        i32.ne
        br_if 0 (;@2;)
        local.get 1
        i32.const 1
        memory.atomic.notify
        drop
      end
      local.get 3
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 1050160
    i32.const 38
    i32.const 1050332
    call $_ZN4core6option13expect_failed17hc92345a96811243cE
    unreachable)
  (func $_ZN3std2io5stdio31print_to_buffer_if_capture_used17h22d3859e0e941b6eE (type 10) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    i32.const 0
    local.set 2
    block  ;; label = @1
      i32.const 0
      i32.atomic.load8_u offset=1053976
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          global.get $__tls_base
          i32.const 4
          i32.add
          local.tee 2
          i32.load
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          i32.const 4
          i32.add
          local.set 3
          br 1 (;@2;)
        end
        i32.const 0
        local.set 2
        global.get $__tls_base
        i32.const 4
        i32.add
        i32.const 0
        call $_ZN3std3sys12thread_local10fast_local12Key$LT$T$GT$14try_initialize17h47dc8302366a5cadE.llvm.11972105620972837968
        local.tee 3
        i32.eqz
        br_if 1 (;@1;)
      end
      local.get 3
      i32.load
      local.set 4
      i32.const 0
      local.set 2
      local.get 3
      i32.const 0
      i32.store
      local.get 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.const 8
      i32.add
      local.set 2
      block  ;; label = @2
        local.get 4
        i32.const 0
        i32.const 1
        i32.atomic.rmw.cmpxchg offset=8
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        call $_ZN3std3sys4sync5mutex5futex5Mutex14lock_contended17h21fa872088556641E
      end
      local.get 1
      i32.const 4
      i32.store8 offset=4
      local.get 1
      local.get 4
      i32.const 12
      i32.add
      i32.store offset=12
      local.get 1
      i32.const 4
      i32.add
      i32.const 1051116
      local.get 0
      call $_ZN4core3fmt5write17h55b62ec8489b4effE
      local.set 5
      local.get 1
      i32.load8_u offset=4
      local.set 0
      block  ;; label = @2
        block  ;; label = @3
          local.get 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          i32.const 4
          i32.eq
          br_if 1 (;@2;)
          local.get 1
          i32.load offset=8
          local.set 5
          block  ;; label = @4
            local.get 1
            i32.load8_u offset=4
            local.tee 0
            i32.const 4
            i32.gt_u
            br_if 0 (;@4;)
            local.get 0
            i32.const 3
            i32.ne
            br_if 2 (;@2;)
          end
          local.get 5
          i32.load
          local.tee 6
          local.get 5
          i32.const 4
          i32.add
          i32.load
          local.tee 0
          i32.load
          call_indirect (type 0)
          block  ;; label = @4
            local.get 0
            i32.load offset=4
            local.tee 7
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            local.get 7
            local.get 0
            i32.load offset=8
            call $__rust_dealloc
          end
          local.get 5
          i32.const 12
          i32.const 4
          call $__rust_dealloc
          br 1 (;@2;)
        end
        local.get 1
        i32.load offset=8
        local.set 5
        block  ;; label = @3
          local.get 0
          i32.const 4
          i32.gt_u
          br_if 0 (;@3;)
          local.get 0
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
        end
        local.get 5
        i32.load
        local.tee 6
        local.get 5
        i32.const 4
        i32.add
        i32.load
        local.tee 0
        i32.load
        call_indirect (type 0)
        block  ;; label = @3
          local.get 0
          i32.load offset=4
          local.tee 7
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          local.get 7
          local.get 0
          i32.load offset=8
          call $__rust_dealloc
        end
        local.get 5
        i32.const 12
        i32.const 4
        call $__rust_dealloc
      end
      block  ;; label = @2
        local.get 2
        i32.const 0
        i32.atomic.rmw.xchg
        i32.const 2
        i32.ne
        br_if 0 (;@2;)
        local.get 2
        i32.const 1
        memory.atomic.notify
        drop
      end
      local.get 1
      local.get 3
      i32.load
      local.tee 2
      i32.store offset=4
      local.get 3
      local.get 4
      i32.store
      block  ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.const 1
        i32.atomic.rmw.sub
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        atomic.fence
        local.get 1
        i32.const 4
        i32.add
        call $_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h272dc83cd57b5547E
      end
      i32.const 1
      local.set 2
    end
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2)
  (func $_ZN3std2io5stdio6_print17h12d72242e7805467E (type 0) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 6
    i32.store offset=12
    local.get 1
    i32.const 1051056
    i32.store offset=8
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        call $_ZN3std2io5stdio31print_to_buffer_if_capture_used17h22d3859e0e941b6eE
        br_if 0 (;@2;)
        block  ;; label = @3
          i32.const 0
          i32.atomic.load offset=1054012
          i32.const 4
          i32.eq
          br_if 0 (;@3;)
          i32.const 1053980
          call $_ZN3std4sync9once_lock17OnceLock$LT$T$GT$10initialize17h904fea820818bbc3E
        end
        local.get 1
        i32.const 1053980
        i32.store offset=28
        local.get 1
        local.get 1
        i32.const 28
        i32.add
        i32.store offset=40
        local.get 1
        i32.const 16
        i32.add
        local.get 1
        i32.const 40
        i32.add
        local.get 0
        call $_ZN61_$LT$$RF$std..io..stdio..Stdout$u20$as$u20$std..io..Write$GT$9write_fmt17h811d540b6973f862E
        local.get 1
        i32.load8_u offset=16
        i32.const 4
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 1
      i32.const 80
      i32.add
      global.set $__stack_pointer
      return
    end
    local.get 1
    local.get 1
    i64.load offset=16
    i64.store offset=32
    local.get 1
    i32.const 76
    i32.add
    i32.const 26
    i32.store
    local.get 1
    i32.const 2
    i32.store offset=44
    local.get 1
    i32.const 1051024
    i32.store offset=40
    local.get 1
    i64.const 2
    i64.store offset=52 align=4
    local.get 1
    i32.const 27
    i32.store offset=68
    local.get 1
    local.get 1
    i32.const 64
    i32.add
    i32.store offset=48
    local.get 1
    local.get 1
    i32.const 32
    i32.add
    i32.store offset=72
    local.get 1
    local.get 1
    i32.const 8
    i32.add
    i32.store offset=64
    local.get 1
    i32.const 40
    i32.add
    i32.const 1051040
    call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
    unreachable)
  (func $_ZN4core3ptr88drop_in_place$LT$std..io..Write..write_fmt..Adapter$LT$alloc..vec..Vec$LT$u8$GT$$GT$$GT$17h04373aee67a077a9E.llvm.9660907189867844885 (type 0) (param i32)
    (local i32 i32 i32)
    local.get 0
    i32.load offset=4
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load8_u
        local.tee 0
        i32.const 4
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 3
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 1
      i32.load
      local.tee 2
      local.get 1
      i32.const 4
      i32.add
      i32.load
      local.tee 0
      i32.load
      call_indirect (type 0)
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        local.get 0
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 1
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end)
  (func $_ZN4core3fmt5Write10write_char17h8fc7d1480738044bE (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i64 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 0
    i32.store offset=12
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            local.get 1
            i32.const 65536
            i32.ge_u
            br_if 2 (;@2;)
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 224
            i32.or
            i32.store8 offset=12
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            i32.const 3
            local.set 3
            br 3 (;@1;)
          end
          local.get 2
          local.get 1
          i32.store8 offset=12
          i32.const 1
          local.set 3
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=13
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 3
        br 1 (;@1;)
      end
      local.get 2
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=15
      local.get 2
      local.get 1
      i32.const 6
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=14
      local.get 2
      local.get 1
      i32.const 12
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=13
      local.get 2
      local.get 1
      i32.const 18
      i32.shr_u
      i32.const 7
      i32.and
      i32.const 240
      i32.or
      i32.store8 offset=12
      i32.const 4
      local.set 3
    end
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      i32.load
      local.tee 1
      i32.load offset=12
      br_if 0 (;@1;)
      local.get 1
      i32.const -1
      i32.store offset=12
      local.get 2
      local.get 1
      i32.const 16
      i32.add
      i32.store offset=28
      local.get 2
      i32.const 16
      i32.add
      local.get 2
      i32.const 28
      i32.add
      local.get 2
      i32.const 12
      i32.add
      local.get 3
      call $_ZN93_$LT$std..io..buffered..linewritershim..LineWriterShim$LT$W$GT$$u20$as$u20$std..io..Write$GT$9write_all17h06beff25007fa475E
      local.get 1
      local.get 1
      i32.load offset=12
      i32.const 1
      i32.add
      i32.store offset=12
      block  ;; label = @2
        local.get 2
        i32.load8_u offset=16
        local.tee 1
        i32.const 4
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=4
        local.set 4
        local.get 2
        i64.load offset=16
        local.set 5
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load8_u
            local.tee 3
            i32.const 4
            i32.gt_u
            br_if 0 (;@4;)
            local.get 3
            i32.const 3
            i32.ne
            br_if 1 (;@3;)
          end
          local.get 4
          i32.load
          local.tee 6
          local.get 4
          i32.const 4
          i32.add
          i32.load
          local.tee 3
          i32.load
          call_indirect (type 0)
          block  ;; label = @4
            local.get 3
            i32.load offset=4
            local.tee 7
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            local.get 7
            local.get 3
            i32.load offset=8
            call $__rust_dealloc
          end
          local.get 4
          i32.const 12
          i32.const 4
          call $__rust_dealloc
        end
        local.get 0
        local.get 5
        i64.store align=4
      end
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
      local.get 1
      i32.const 4
      i32.ne
      return
    end
    i32.const 1050984
    call $_ZN4core4cell22panic_already_borrowed17hfa55c2be5c5c6eb4E
    unreachable)
  (func $_ZN4core3fmt5Write10write_char17hc89cc9fd0af3e181E (type 2) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 0
    i32.store offset=12
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            local.get 1
            i32.const 65536
            i32.ge_u
            br_if 2 (;@2;)
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 224
            i32.or
            i32.store8 offset=12
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            i32.const 3
            local.set 3
            br 3 (;@1;)
          end
          local.get 2
          local.get 1
          i32.store8 offset=12
          i32.const 1
          local.set 3
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=13
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 3
        br 1 (;@1;)
      end
      local.get 2
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=15
      local.get 2
      local.get 1
      i32.const 6
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=14
      local.get 2
      local.get 1
      i32.const 12
      i32.shr_u
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8 offset=13
      local.get 2
      local.get 1
      i32.const 18
      i32.shr_u
      i32.const 7
      i32.and
      i32.const 240
      i32.or
      i32.store8 offset=12
      i32.const 4
      local.set 3
    end
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      local.tee 1
      i32.load
      local.get 1
      i32.load offset=8
      local.tee 0
      i32.sub
      local.get 3
      i32.ge_u
      br_if 0 (;@1;)
      local.get 1
      local.get 0
      local.get 3
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17ha8d8870fa1fd559bE
      local.get 1
      i32.load offset=8
      local.set 0
    end
    local.get 1
    i32.load offset=4
    local.get 0
    i32.add
    local.get 2
    i32.const 12
    i32.add
    local.get 3
    memory.copy
    local.get 1
    local.get 0
    local.get 3
    i32.add
    i32.store offset=8
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    i32.const 0)
  (func $_ZN4core3fmt5Write9write_fmt17h11b5748d5310bc97E (type 2) (param i32 i32) (result i32)
    local.get 0
    i32.const 1051140
    local.get 1
    call $_ZN4core3fmt5write17h55b62ec8489b4effE)
  (func $_ZN4core3fmt5Write9write_fmt17h22fbf674e3ba7d8eE (type 2) (param i32 i32) (result i32)
    local.get 0
    i32.const 1051164
    local.get 1
    call $_ZN4core3fmt5write17h55b62ec8489b4effE)
  (func $_ZN4core3ptr88drop_in_place$LT$std..io..Write..write_fmt..Adapter$LT$alloc..vec..Vec$LT$u8$GT$$GT$$GT$17h04373aee67a077a9E (type 0) (param i32)
    (local i32 i32 i32)
    local.get 0
    i32.load offset=4
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load8_u
        local.tee 0
        i32.const 4
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        i32.const 3
        i32.ne
        br_if 1 (;@1;)
      end
      local.get 1
      i32.load
      local.tee 2
      local.get 1
      i32.const 4
      i32.add
      i32.load
      local.tee 0
      i32.load
      call_indirect (type 0)
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        local.get 0
        i32.load offset=8
        call $__rust_dealloc
      end
      local.get 1
      i32.const 12
      i32.const 4
      call $__rust_dealloc
    end)
  (func $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17h846113e4f2abcc3dE (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32 i64 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      i32.load
      local.tee 4
      i32.load offset=12
      br_if 0 (;@1;)
      local.get 4
      i32.const -1
      i32.store offset=12
      local.get 3
      local.get 4
      i32.const 16
      i32.add
      i32.store offset=12
      local.get 3
      local.get 3
      i32.const 12
      i32.add
      local.get 1
      local.get 2
      call $_ZN93_$LT$std..io..buffered..linewritershim..LineWriterShim$LT$W$GT$$u20$as$u20$std..io..Write$GT$9write_all17h06beff25007fa475E
      local.get 4
      local.get 4
      i32.load offset=12
      i32.const 1
      i32.add
      i32.store offset=12
      block  ;; label = @2
        local.get 3
        i32.load8_u
        local.tee 4
        i32.const 4
        i32.eq
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=4
        local.set 1
        local.get 3
        i64.load
        local.set 5
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load8_u
            local.tee 2
            i32.const 4
            i32.gt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const 3
            i32.ne
            br_if 1 (;@3;)
          end
          local.get 1
          i32.load
          local.tee 6
          local.get 1
          i32.const 4
          i32.add
          i32.load
          local.tee 2
          i32.load
          call_indirect (type 0)
          block  ;; label = @4
            local.get 2
            i32.load offset=4
            local.tee 7
            i32.eqz
            br_if 0 (;@4;)
            local.get 6
            local.get 7
            local.get 2
            i32.load offset=8
            call $__rust_dealloc
          end
          local.get 1
          i32.const 12
          i32.const 4
          call $__rust_dealloc
        end
        local.get 0
        local.get 5
        i64.store align=4
      end
      local.get 3
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 4
      i32.const 4
      i32.ne
      return
    end
    i32.const 1050984
    call $_ZN4core4cell22panic_already_borrowed17hfa55c2be5c5c6eb4E
    unreachable)
  (func $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17ha64215833ac6d838E (type 3) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      local.tee 0
      i32.load
      local.get 0
      i32.load offset=8
      local.tee 3
      i32.sub
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 2
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17ha8d8870fa1fd559bE
      local.get 0
      i32.load offset=8
      local.set 3
    end
    local.get 0
    i32.load offset=4
    local.get 3
    i32.add
    local.get 1
    local.get 2
    memory.copy
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0)
  (func $_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17hfb89e3d6c2568f08E.1 (type 2) (param i32 i32) (result i32)
    local.get 0
    i32.load offset=4
    local.get 0
    i32.load offset=8
    local.get 1
    call $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h88408237604245e2E)
  (func $_ZN60_$LT$std..io..error..Error$u20$as$u20$core..fmt..Display$GT$3fmt17hf06d594d26b2c655E (type 2) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load8_u
                br_table 0 (;@6;) 1 (;@5;) 2 (;@4;) 3 (;@3;) 0 (;@6;)
              end
              local.get 2
              local.get 0
              i32.load offset=4
              i32.store offset=8
              i32.const 0
              i32.load8_u offset=1053953
              drop
              i32.const 20
              i32.const 1
              call $__rust_alloc
              local.tee 0
              i32.eqz
              br_if 4 (;@1;)
              local.get 0
              i32.const 16
              i32.add
              i32.const 0
              i32.load offset=1052572 align=1
              i32.store align=1
              local.get 0
              i32.const 8
              i32.add
              i32.const 0
              i64.load offset=1052564 align=1
              i64.store align=1
              local.get 0
              i32.const 0
              i64.load offset=1052556 align=1
              i64.store align=1
              local.get 2
              i32.const 20
              i32.store offset=20
              local.get 2
              local.get 0
              i32.store offset=16
              local.get 2
              i32.const 20
              i32.store offset=12
              local.get 2
              i32.const 36
              i32.add
              i32.const 37
              i32.store
              local.get 2
              i32.const 3
              i32.store offset=44
              local.get 2
              i32.const 1051952
              i32.store offset=40
              local.get 2
              i64.const 2
              i64.store offset=52 align=4
              local.get 2
              i32.const 38
              i32.store offset=28
              local.get 2
              local.get 2
              i32.const 24
              i32.add
              i32.store offset=48
              local.get 2
              local.get 2
              i32.const 8
              i32.add
              i32.store offset=32
              local.get 2
              local.get 2
              i32.const 12
              i32.add
              i32.store offset=24
              local.get 1
              i32.load offset=20
              local.get 1
              i32.load offset=24
              local.get 2
              i32.const 40
              i32.add
              call $_ZN4core3fmt5write17h55b62ec8489b4effE
              local.set 0
              local.get 2
              i32.load offset=12
              local.tee 1
              i32.eqz
              br_if 3 (;@2;)
              local.get 2
              i32.load offset=16
              local.get 1
              i32.const 1
              call $__rust_dealloc
              br 3 (;@2;)
            end
            local.get 0
            i32.load8_u offset=1
            local.set 0
            local.get 2
            i32.const 1
            i32.store offset=44
            local.get 2
            i32.const 1051976
            i32.store offset=40
            local.get 2
            i64.const 1
            i64.store offset=52 align=4
            local.get 2
            i32.const 27
            i32.store offset=16
            local.get 2
            local.get 0
            i32.const 2
            i32.shl
            local.tee 0
            i32.const 1051984
            i32.add
            i32.load
            i32.store offset=28
            local.get 2
            local.get 0
            i32.const 1052148
            i32.add
            i32.load
            i32.store offset=24
            local.get 2
            local.get 2
            i32.const 12
            i32.add
            i32.store offset=48
            local.get 2
            local.get 2
            i32.const 24
            i32.add
            i32.store offset=12
            local.get 1
            i32.load offset=20
            local.get 1
            i32.load offset=24
            local.get 2
            i32.const 40
            i32.add
            call $_ZN4core3fmt5write17h55b62ec8489b4effE
            local.set 0
            br 2 (;@2;)
          end
          local.get 0
          i32.load offset=4
          local.tee 0
          i32.load
          local.get 0
          i32.load offset=4
          local.get 1
          call $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h88408237604245e2E
          local.set 0
          br 1 (;@2;)
        end
        local.get 0
        i32.load offset=4
        local.tee 0
        i32.load
        local.get 1
        local.get 0
        i32.load offset=4
        i32.load offset=16
        call_indirect (type 2)
        local.set 0
      end
      local.get 2
      i32.const 64
      i32.add
      global.set $__stack_pointer
      local.get 0
      return
    end
    i32.const 1
    i32.const 20
    call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
    unreachable)
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h8a5b56aa007b533cE (type 6) (param i32 i32 i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 256
          i32.lt_u
          br_if 0 (;@3;)
          local.get 1
          i32.load offset=24
          local.set 3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 1
                i32.load offset=12
                local.tee 2
                local.get 1
                i32.ne
                br_if 0 (;@6;)
                local.get 1
                i32.const 20
                i32.const 16
                local.get 1
                i32.load offset=20
                local.tee 2
                select
                i32.add
                i32.load
                local.tee 4
                br_if 1 (;@5;)
                i32.const 0
                local.set 2
                br 2 (;@4;)
              end
              local.get 1
              i32.load offset=8
              local.tee 4
              local.get 2
              i32.store offset=12
              local.get 2
              local.get 4
              i32.store offset=8
              br 1 (;@4;)
            end
            local.get 1
            i32.const 20
            i32.add
            local.get 1
            i32.const 16
            i32.add
            local.get 2
            select
            local.set 5
            loop  ;; label = @5
              local.get 5
              local.set 6
              local.get 4
              local.tee 2
              i32.const 20
              i32.add
              local.get 2
              i32.const 16
              i32.add
              local.get 2
              i32.load offset=20
              local.tee 4
              select
              local.set 5
              local.get 2
              i32.const 20
              i32.const 16
              local.get 4
              select
              i32.add
              i32.load
              local.tee 4
              br_if 0 (;@5;)
            end
            local.get 6
            i32.const 0
            i32.store
          end
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          block  ;; label = @4
            local.get 0
            local.get 1
            i32.load offset=28
            local.tee 5
            i32.const 2
            i32.shl
            i32.add
            local.tee 4
            i32.load
            local.get 1
            i32.eq
            br_if 0 (;@4;)
            local.get 3
            i32.const 16
            i32.const 20
            local.get 3
            i32.load offset=16
            local.get 1
            i32.eq
            select
            i32.add
            local.get 2
            i32.store
            local.get 2
            i32.eqz
            br_if 3 (;@1;)
            br 2 (;@2;)
          end
          local.get 4
          local.get 2
          i32.store
          local.get 2
          br_if 1 (;@2;)
          local.get 0
          local.get 0
          i32.load offset=412
          i32.const -2
          local.get 5
          i32.rotl
          i32.and
          i32.store offset=412
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 1
          i32.load offset=12
          local.tee 4
          local.get 1
          i32.load offset=8
          local.tee 5
          i32.eq
          br_if 0 (;@3;)
          local.get 5
          local.get 4
          i32.store offset=12
          local.get 4
          local.get 5
          i32.store offset=8
          return
        end
        local.get 0
        local.get 0
        i32.load offset=408
        i32.const -2
        local.get 2
        i32.const 3
        i32.shr_u
        i32.rotl
        i32.and
        i32.store offset=408
        return
      end
      local.get 2
      local.get 3
      i32.store offset=24
      block  ;; label = @2
        local.get 1
        i32.load offset=16
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 4
        i32.store offset=16
        local.get 4
        local.get 2
        i32.store offset=24
      end
      local.get 1
      i32.load offset=20
      local.tee 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 4
      i32.store offset=20
      local.get 4
      local.get 2
      i32.store offset=24
      return
    end)
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17hc73bbef596940e15E.llvm.14233881234370288605 (type 6) (param i32 i32 i32)
    (local i32 i32 i32)
    local.get 1
    local.get 2
    i32.add
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.load offset=4
        local.tee 4
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 4
        i32.const 2
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        i32.load
        local.tee 4
        local.get 2
        i32.add
        local.set 2
        block  ;; label = @3
          local.get 1
          local.get 4
          i32.sub
          local.tee 1
          local.get 0
          i32.load offset=424
          i32.ne
          br_if 0 (;@3;)
          local.get 3
          i32.load offset=4
          local.tee 4
          i32.const 3
          i32.and
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
          local.get 3
          local.get 4
          i32.const -2
          i32.and
          i32.store offset=4
          local.get 1
          local.get 2
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          local.get 2
          i32.store offset=416
          local.get 3
          local.get 2
          i32.store
          br 2 (;@1;)
        end
        local.get 0
        local.get 1
        local.get 4
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h8a5b56aa007b533cE
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 3
              i32.load offset=4
              local.tee 4
              i32.const 2
              i32.and
              br_if 0 (;@5;)
              local.get 3
              local.get 0
              i32.load offset=428
              i32.eq
              br_if 2 (;@3;)
              local.get 3
              local.get 0
              i32.load offset=424
              i32.eq
              br_if 3 (;@2;)
              local.get 0
              local.get 3
              local.get 4
              i32.const -8
              i32.and
              local.tee 4
              call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h8a5b56aa007b533cE
              local.get 1
              local.get 4
              local.get 2
              i32.add
              local.tee 2
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 1
              local.get 2
              i32.add
              local.get 2
              i32.store
              local.get 1
              local.get 0
              i32.load offset=424
              i32.ne
              br_if 1 (;@4;)
              local.get 0
              local.get 2
              i32.store offset=416
              return
            end
            local.get 3
            local.get 4
            i32.const -2
            i32.and
            i32.store offset=4
            local.get 1
            local.get 2
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 1
            local.get 2
            i32.add
            local.get 2
            i32.store
          end
          block  ;; label = @4
            local.get 2
            i32.const 256
            i32.lt_u
            br_if 0 (;@4;)
            i32.const 31
            local.set 3
            block  ;; label = @5
              local.get 2
              i32.const 16777215
              i32.gt_u
              br_if 0 (;@5;)
              local.get 2
              i32.const 6
              local.get 2
              i32.const 8
              i32.shr_u
              i32.clz
              local.tee 3
              i32.sub
              i32.shr_u
              i32.const 1
              i32.and
              local.get 3
              i32.const 1
              i32.shl
              i32.sub
              i32.const 62
              i32.add
              local.set 3
            end
            local.get 1
            i64.const 0
            i64.store offset=16 align=4
            local.get 1
            local.get 3
            i32.store offset=28
            local.get 0
            local.get 3
            i32.const 2
            i32.shl
            i32.add
            local.set 4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load offset=412
                i32.const 1
                local.get 3
                i32.shl
                local.tee 5
                i32.and
                br_if 0 (;@6;)
                local.get 4
                local.get 1
                i32.store
                local.get 1
                local.get 4
                i32.store offset=24
                local.get 0
                local.get 0
                i32.load offset=412
                local.get 5
                i32.or
                i32.store offset=412
                br 1 (;@5;)
              end
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 4
                    i32.load
                    local.tee 4
                    i32.load offset=4
                    i32.const -8
                    i32.and
                    local.get 2
                    i32.ne
                    br_if 0 (;@8;)
                    local.get 4
                    local.set 0
                    br 1 (;@7;)
                  end
                  local.get 2
                  i32.const 0
                  i32.const 25
                  local.get 3
                  i32.const 1
                  i32.shr_u
                  i32.sub
                  local.get 3
                  i32.const 31
                  i32.eq
                  select
                  i32.shl
                  local.set 3
                  loop  ;; label = @8
                    local.get 4
                    local.get 3
                    i32.const 29
                    i32.shr_u
                    i32.const 4
                    i32.and
                    i32.add
                    i32.const 16
                    i32.add
                    local.tee 5
                    i32.load
                    local.tee 0
                    i32.eqz
                    br_if 2 (;@6;)
                    local.get 3
                    i32.const 1
                    i32.shl
                    local.set 3
                    local.get 0
                    local.set 4
                    local.get 0
                    i32.load offset=4
                    i32.const -8
                    i32.and
                    local.get 2
                    i32.ne
                    br_if 0 (;@8;)
                  end
                end
                local.get 0
                i32.load offset=8
                local.tee 2
                local.get 1
                i32.store offset=12
                local.get 0
                local.get 1
                i32.store offset=8
                local.get 1
                i32.const 0
                i32.store offset=24
                local.get 1
                local.get 0
                i32.store offset=12
                local.get 1
                local.get 2
                i32.store offset=8
                return
              end
              local.get 5
              local.get 1
              i32.store
              local.get 1
              local.get 4
              i32.store offset=24
            end
            local.get 1
            local.get 1
            i32.store offset=12
            local.get 1
            local.get 1
            i32.store offset=8
            return
          end
          local.get 0
          local.get 2
          i32.const -8
          i32.and
          i32.add
          i32.const 144
          i32.add
          local.set 3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.load offset=408
              local.tee 4
              i32.const 1
              local.get 2
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 2
              i32.and
              br_if 0 (;@5;)
              local.get 0
              local.get 4
              local.get 2
              i32.or
              i32.store offset=408
              local.get 3
              local.set 2
              br 1 (;@4;)
            end
            local.get 3
            i32.load offset=8
            local.set 2
          end
          local.get 3
          local.get 1
          i32.store offset=8
          local.get 2
          local.get 1
          i32.store offset=12
          local.get 1
          local.get 3
          i32.store offset=12
          local.get 1
          local.get 2
          i32.store offset=8
          return
        end
        local.get 0
        local.get 1
        i32.store offset=428
        local.get 0
        local.get 0
        i32.load offset=420
        local.get 2
        i32.add
        local.tee 2
        i32.store offset=420
        local.get 1
        local.get 2
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 1
        local.get 0
        i32.load offset=424
        i32.ne
        br_if 1 (;@1;)
        local.get 0
        i32.const 0
        i32.store offset=416
        local.get 0
        i32.const 0
        i32.store offset=424
        return
      end
      local.get 1
      local.get 0
      i32.load offset=416
      local.get 2
      i32.add
      local.tee 2
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 0
      local.get 1
      i32.store offset=424
      local.get 0
      local.get 2
      i32.store offset=416
      local.get 1
      local.get 2
      i32.add
      local.get 2
      i32.store
      return
    end)
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h73476a47273f3bb9E (type 6) (param i32 i32 i32)
    (local i32 i32 i32)
    i32.const 31
    local.set 3
    block  ;; label = @1
      local.get 2
      i32.const 16777215
      i32.gt_u
      br_if 0 (;@1;)
      local.get 2
      i32.const 6
      local.get 2
      i32.const 8
      i32.shr_u
      i32.clz
      local.tee 3
      i32.sub
      i32.shr_u
      i32.const 1
      i32.and
      local.get 3
      i32.const 1
      i32.shl
      i32.sub
      i32.const 62
      i32.add
      local.set 3
    end
    local.get 1
    i64.const 0
    i64.store offset=16 align=4
    local.get 1
    local.get 3
    i32.store offset=28
    local.get 0
    local.get 3
    i32.const 2
    i32.shl
    i32.add
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=412
        i32.const 1
        local.get 3
        i32.shl
        local.tee 5
        i32.and
        br_if 0 (;@2;)
        local.get 4
        local.get 1
        i32.store
        local.get 1
        local.get 4
        i32.store offset=24
        local.get 0
        local.get 0
        i32.load offset=412
        local.get 5
        i32.or
        i32.store offset=412
        br 1 (;@1;)
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 4
            i32.load
            local.tee 4
            i32.load offset=4
            i32.const -8
            i32.and
            local.get 2
            i32.ne
            br_if 0 (;@4;)
            local.get 4
            local.set 3
            br 1 (;@3;)
          end
          local.get 2
          i32.const 0
          i32.const 25
          local.get 3
          i32.const 1
          i32.shr_u
          i32.sub
          local.get 3
          i32.const 31
          i32.eq
          select
          i32.shl
          local.set 0
          loop  ;; label = @4
            local.get 4
            local.get 0
            i32.const 29
            i32.shr_u
            i32.const 4
            i32.and
            i32.add
            i32.const 16
            i32.add
            local.tee 5
            i32.load
            local.tee 3
            i32.eqz
            br_if 2 (;@2;)
            local.get 0
            i32.const 1
            i32.shl
            local.set 0
            local.get 3
            local.set 4
            local.get 3
            i32.load offset=4
            i32.const -8
            i32.and
            local.get 2
            i32.ne
            br_if 0 (;@4;)
          end
        end
        local.get 3
        i32.load offset=8
        local.tee 0
        local.get 1
        i32.store offset=12
        local.get 3
        local.get 1
        i32.store offset=8
        local.get 1
        i32.const 0
        i32.store offset=24
        local.get 1
        local.get 3
        i32.store offset=12
        local.get 1
        local.get 0
        i32.store offset=8
        return
      end
      local.get 5
      local.get 1
      i32.store
      local.get 1
      local.get 4
      i32.store offset=24
    end
    local.get 1
    local.get 1
    i32.store offset=12
    local.get 1
    local.get 1
    i32.store offset=8)
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$4free17hc03c95c3cec481e0E (type 1) (param i32 i32)
    (local i32 i32 i32 i32 i32)
    local.get 1
    i32.const -8
    i32.add
    local.tee 2
    local.get 1
    i32.const -4
    i32.add
    i32.load
    local.tee 3
    i32.const -8
    i32.and
    local.tee 1
    i32.add
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 3
        i32.const 2
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 2
        i32.load
        local.tee 3
        local.get 1
        i32.add
        local.set 1
        block  ;; label = @3
          local.get 2
          local.get 3
          i32.sub
          local.tee 2
          local.get 0
          i32.load offset=424
          i32.ne
          br_if 0 (;@3;)
          local.get 4
          i32.load offset=4
          local.tee 3
          i32.const 3
          i32.and
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
          local.get 4
          local.get 3
          i32.const -2
          i32.and
          i32.store offset=4
          local.get 2
          local.get 1
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          local.get 1
          i32.store offset=416
          local.get 4
          local.get 1
          i32.store
          return
        end
        local.get 0
        local.get 2
        local.get 3
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h8a5b56aa007b533cE
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 4
                          i32.load offset=4
                          local.tee 3
                          i32.const 2
                          i32.and
                          br_if 0 (;@11;)
                          local.get 4
                          local.get 0
                          i32.load offset=428
                          i32.eq
                          br_if 2 (;@9;)
                          local.get 4
                          local.get 0
                          i32.load offset=424
                          i32.eq
                          br_if 9 (;@2;)
                          local.get 0
                          local.get 4
                          local.get 3
                          i32.const -8
                          i32.and
                          local.tee 3
                          call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h8a5b56aa007b533cE
                          local.get 2
                          local.get 3
                          local.get 1
                          i32.add
                          local.tee 1
                          i32.const 1
                          i32.or
                          i32.store offset=4
                          local.get 2
                          local.get 1
                          i32.add
                          local.get 1
                          i32.store
                          local.get 2
                          local.get 0
                          i32.load offset=424
                          i32.ne
                          br_if 1 (;@10;)
                          local.get 0
                          local.get 1
                          i32.store offset=416
                          return
                        end
                        local.get 4
                        local.get 3
                        i32.const -2
                        i32.and
                        i32.store offset=4
                        local.get 2
                        local.get 1
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 2
                        local.get 1
                        i32.add
                        local.get 1
                        i32.store
                      end
                      local.get 1
                      i32.const 256
                      i32.lt_u
                      br_if 4 (;@5;)
                      i32.const 31
                      local.set 4
                      block  ;; label = @10
                        local.get 1
                        i32.const 16777215
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 1
                        i32.const 6
                        local.get 1
                        i32.const 8
                        i32.shr_u
                        i32.clz
                        local.tee 4
                        i32.sub
                        i32.shr_u
                        i32.const 1
                        i32.and
                        local.get 4
                        i32.const 1
                        i32.shl
                        i32.sub
                        i32.const 62
                        i32.add
                        local.set 4
                      end
                      local.get 2
                      i64.const 0
                      i64.store offset=16 align=4
                      local.get 2
                      local.get 4
                      i32.store offset=28
                      local.get 0
                      local.get 4
                      i32.const 2
                      i32.shl
                      i32.add
                      local.set 3
                      local.get 0
                      i32.load offset=412
                      i32.const 1
                      local.get 4
                      i32.shl
                      local.tee 5
                      i32.and
                      br_if 1 (;@8;)
                      local.get 3
                      local.get 2
                      i32.store
                      local.get 2
                      local.get 3
                      i32.store offset=24
                      local.get 0
                      local.get 0
                      i32.load offset=412
                      local.get 5
                      i32.or
                      i32.store offset=412
                      br 2 (;@7;)
                    end
                    local.get 0
                    local.get 2
                    i32.store offset=428
                    local.get 0
                    local.get 0
                    i32.load offset=420
                    local.get 1
                    i32.add
                    local.tee 1
                    i32.store offset=420
                    local.get 2
                    local.get 1
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    block  ;; label = @9
                      local.get 2
                      local.get 0
                      i32.load offset=424
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 0
                      i32.const 0
                      i32.store offset=416
                      local.get 0
                      i32.const 0
                      i32.store offset=424
                    end
                    local.get 1
                    local.get 0
                    i32.load offset=440
                    i32.le_u
                    br_if 7 (;@1;)
                    block  ;; label = @9
                      local.get 1
                      i32.const 41
                      i32.lt_u
                      br_if 0 (;@9;)
                      local.get 0
                      i32.const 128
                      i32.add
                      local.set 1
                      loop  ;; label = @10
                        block  ;; label = @11
                          local.get 1
                          i32.load
                          local.tee 4
                          local.get 2
                          i32.gt_u
                          br_if 0 (;@11;)
                          local.get 4
                          local.get 1
                          i32.load offset=4
                          i32.add
                          local.get 2
                          i32.gt_u
                          br_if 2 (;@9;)
                        end
                        local.get 1
                        i32.load offset=8
                        local.tee 1
                        br_if 0 (;@10;)
                      end
                    end
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 0
                        i32.load offset=136
                        local.tee 1
                        br_if 0 (;@10;)
                        i32.const 0
                        local.set 2
                        br 1 (;@9;)
                      end
                      i32.const 0
                      local.set 2
                      loop  ;; label = @10
                        local.get 2
                        i32.const 1
                        i32.add
                        local.set 2
                        local.get 1
                        i32.load offset=8
                        local.tee 1
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 0
                    i32.const -1
                    i32.store offset=440
                    local.get 0
                    local.get 2
                    i32.const 4095
                    local.get 2
                    i32.const 4095
                    i32.gt_u
                    select
                    i32.store offset=448
                    br 7 (;@1;)
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 3
                        i32.load
                        local.tee 5
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        local.get 1
                        i32.ne
                        br_if 0 (;@10;)
                        local.get 5
                        local.set 4
                        br 1 (;@9;)
                      end
                      local.get 1
                      i32.const 0
                      i32.const 25
                      local.get 4
                      i32.const 1
                      i32.shr_u
                      i32.sub
                      local.get 4
                      i32.const 31
                      i32.eq
                      select
                      i32.shl
                      local.set 3
                      loop  ;; label = @10
                        local.get 5
                        local.get 3
                        i32.const 29
                        i32.shr_u
                        i32.const 4
                        i32.and
                        i32.add
                        i32.const 16
                        i32.add
                        local.tee 6
                        i32.load
                        local.tee 4
                        i32.eqz
                        br_if 2 (;@8;)
                        local.get 3
                        i32.const 1
                        i32.shl
                        local.set 3
                        local.get 4
                        local.set 5
                        local.get 4
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        local.get 1
                        i32.ne
                        br_if 0 (;@10;)
                      end
                    end
                    local.get 4
                    i32.load offset=8
                    local.tee 1
                    local.get 2
                    i32.store offset=12
                    local.get 4
                    local.get 2
                    i32.store offset=8
                    local.get 2
                    i32.const 0
                    i32.store offset=24
                    local.get 2
                    local.get 4
                    i32.store offset=12
                    local.get 2
                    local.get 1
                    i32.store offset=8
                    br 2 (;@6;)
                  end
                  local.get 6
                  local.get 2
                  i32.store
                  local.get 2
                  local.get 5
                  i32.store offset=24
                end
                local.get 2
                local.get 2
                i32.store offset=12
                local.get 2
                local.get 2
                i32.store offset=8
              end
              local.get 0
              local.get 0
              i32.load offset=448
              i32.const -1
              i32.add
              local.tee 2
              i32.store offset=448
              local.get 2
              br_if 4 (;@1;)
              local.get 0
              i32.load offset=136
              local.tee 1
              br_if 1 (;@4;)
              i32.const 0
              local.set 2
              br 2 (;@3;)
            end
            local.get 0
            local.get 1
            i32.const -8
            i32.and
            i32.add
            i32.const 144
            i32.add
            local.set 4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load offset=408
                local.tee 3
                i32.const 1
                local.get 1
                i32.const 3
                i32.shr_u
                i32.shl
                local.tee 1
                i32.and
                br_if 0 (;@6;)
                local.get 0
                local.get 3
                local.get 1
                i32.or
                i32.store offset=408
                local.get 4
                local.set 1
                br 1 (;@5;)
              end
              local.get 4
              i32.load offset=8
              local.set 1
            end
            local.get 4
            local.get 2
            i32.store offset=8
            local.get 1
            local.get 2
            i32.store offset=12
            local.get 2
            local.get 4
            i32.store offset=12
            local.get 2
            local.get 1
            i32.store offset=8
            return
          end
          i32.const 0
          local.set 2
          loop  ;; label = @4
            local.get 2
            i32.const 1
            i32.add
            local.set 2
            local.get 1
            i32.load offset=8
            local.tee 1
            br_if 0 (;@4;)
          end
        end
        local.get 0
        local.get 2
        i32.const 4095
        local.get 2
        i32.const 4095
        i32.gt_u
        select
        i32.store offset=448
        return
      end
      local.get 2
      local.get 0
      i32.load offset=416
      local.get 1
      i32.add
      local.tee 1
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 0
      local.get 2
      i32.store offset=424
      local.get 0
      local.get 1
      i32.store offset=416
      local.get 2
      local.get 1
      i32.add
      local.get 1
      i32.store
      return
    end)
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17h0a666368b1102bfeE (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 1
                    i32.const 245
                    i32.lt_u
                    br_if 0 (;@8;)
                    i32.const 0
                    local.set 3
                    local.get 1
                    i32.const -65587
                    i32.ge_u
                    br_if 7 (;@1;)
                    local.get 1
                    i32.const 11
                    i32.add
                    local.tee 3
                    i32.const -8
                    i32.and
                    local.set 4
                    local.get 0
                    i32.load offset=412
                    local.tee 5
                    i32.eqz
                    br_if 4 (;@4;)
                    i32.const 0
                    local.set 1
                    i32.const 0
                    local.set 6
                    block  ;; label = @9
                      local.get 4
                      i32.const 256
                      i32.lt_u
                      br_if 0 (;@9;)
                      i32.const 31
                      local.set 6
                      local.get 4
                      i32.const 16777215
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 4
                      i32.const 6
                      local.get 3
                      i32.const 8
                      i32.shr_u
                      i32.clz
                      local.tee 3
                      i32.sub
                      i32.shr_u
                      i32.const 1
                      i32.and
                      local.get 3
                      i32.const 1
                      i32.shl
                      i32.sub
                      i32.const 62
                      i32.add
                      local.set 6
                    end
                    i32.const 0
                    local.get 4
                    i32.sub
                    local.set 3
                    block  ;; label = @9
                      local.get 0
                      local.get 6
                      i32.const 2
                      i32.shl
                      i32.add
                      i32.load
                      local.tee 7
                      br_if 0 (;@9;)
                      i32.const 0
                      local.set 8
                      br 2 (;@7;)
                    end
                    i32.const 0
                    local.set 1
                    local.get 4
                    i32.const 0
                    i32.const 25
                    local.get 6
                    i32.const 1
                    i32.shr_u
                    i32.sub
                    local.get 6
                    i32.const 31
                    i32.eq
                    select
                    i32.shl
                    local.set 9
                    i32.const 0
                    local.set 8
                    loop  ;; label = @9
                      block  ;; label = @10
                        local.get 7
                        local.tee 7
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        local.tee 10
                        local.get 4
                        i32.lt_u
                        br_if 0 (;@10;)
                        local.get 10
                        local.get 4
                        i32.sub
                        local.tee 10
                        local.get 3
                        i32.ge_u
                        br_if 0 (;@10;)
                        local.get 10
                        local.set 3
                        local.get 7
                        local.set 8
                        local.get 10
                        br_if 0 (;@10;)
                        i32.const 0
                        local.set 3
                        local.get 7
                        local.set 8
                        local.get 7
                        local.set 1
                        br 4 (;@6;)
                      end
                      local.get 7
                      i32.load offset=20
                      local.tee 10
                      local.get 1
                      local.get 10
                      local.get 7
                      local.get 9
                      i32.const 29
                      i32.shr_u
                      i32.const 4
                      i32.and
                      i32.add
                      i32.const 16
                      i32.add
                      i32.load
                      local.tee 7
                      i32.ne
                      select
                      local.get 1
                      local.get 10
                      select
                      local.set 1
                      local.get 9
                      i32.const 1
                      i32.shl
                      local.set 9
                      local.get 7
                      i32.eqz
                      br_if 2 (;@7;)
                      br 0 (;@9;)
                    end
                  end
                  block  ;; label = @8
                    local.get 0
                    i32.load offset=408
                    local.tee 7
                    i32.const 16
                    local.get 1
                    i32.const 11
                    i32.add
                    i32.const 504
                    i32.and
                    local.get 1
                    i32.const 11
                    i32.lt_u
                    select
                    local.tee 4
                    i32.const 3
                    i32.shr_u
                    local.tee 3
                    i32.shr_u
                    local.tee 1
                    i32.const 3
                    i32.and
                    i32.eqz
                    br_if 0 (;@8;)
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 0
                        local.get 1
                        i32.const -1
                        i32.xor
                        i32.const 1
                        i32.and
                        local.get 3
                        i32.add
                        local.tee 4
                        i32.const 3
                        i32.shl
                        i32.add
                        local.tee 1
                        i32.const 144
                        i32.add
                        local.tee 3
                        local.get 1
                        i32.const 152
                        i32.add
                        i32.load
                        local.tee 1
                        i32.load offset=8
                        local.tee 8
                        i32.eq
                        br_if 0 (;@10;)
                        local.get 8
                        local.get 3
                        i32.store offset=12
                        local.get 3
                        local.get 8
                        i32.store offset=8
                        br 1 (;@9;)
                      end
                      local.get 0
                      local.get 7
                      i32.const -2
                      local.get 4
                      i32.rotl
                      i32.and
                      i32.store offset=408
                    end
                    local.get 1
                    i32.const 8
                    i32.add
                    local.set 3
                    local.get 1
                    local.get 4
                    i32.const 3
                    i32.shl
                    local.tee 4
                    i32.const 3
                    i32.or
                    i32.store offset=4
                    local.get 1
                    local.get 4
                    i32.add
                    local.tee 1
                    local.get 1
                    i32.load offset=4
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    br 7 (;@1;)
                  end
                  local.get 4
                  local.get 0
                  i32.load offset=416
                  i32.le_u
                  br_if 3 (;@4;)
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 1
                        br_if 0 (;@10;)
                        local.get 0
                        i32.load offset=412
                        local.tee 1
                        i32.eqz
                        br_if 6 (;@4;)
                        local.get 0
                        local.get 1
                        i32.ctz
                        i32.const 2
                        i32.shl
                        i32.add
                        i32.load
                        local.tee 8
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        local.get 4
                        i32.sub
                        local.set 3
                        local.get 8
                        local.set 7
                        loop  ;; label = @11
                          block  ;; label = @12
                            local.get 8
                            i32.load offset=16
                            local.tee 1
                            br_if 0 (;@12;)
                            local.get 8
                            i32.load offset=20
                            local.tee 1
                            br_if 0 (;@12;)
                            local.get 7
                            i32.load offset=24
                            local.set 6
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 7
                                  i32.load offset=12
                                  local.tee 1
                                  local.get 7
                                  i32.ne
                                  br_if 0 (;@15;)
                                  local.get 7
                                  i32.const 20
                                  i32.const 16
                                  local.get 7
                                  i32.load offset=20
                                  local.tee 1
                                  select
                                  i32.add
                                  i32.load
                                  local.tee 8
                                  br_if 1 (;@14;)
                                  i32.const 0
                                  local.set 1
                                  br 2 (;@13;)
                                end
                                local.get 7
                                i32.load offset=8
                                local.tee 8
                                local.get 1
                                i32.store offset=12
                                local.get 1
                                local.get 8
                                i32.store offset=8
                                br 1 (;@13;)
                              end
                              local.get 7
                              i32.const 20
                              i32.add
                              local.get 7
                              i32.const 16
                              i32.add
                              local.get 1
                              select
                              local.set 9
                              loop  ;; label = @14
                                local.get 9
                                local.set 10
                                local.get 8
                                local.tee 1
                                i32.const 20
                                i32.add
                                local.get 1
                                i32.const 16
                                i32.add
                                local.get 1
                                i32.load offset=20
                                local.tee 8
                                select
                                local.set 9
                                local.get 1
                                i32.const 20
                                i32.const 16
                                local.get 8
                                select
                                i32.add
                                i32.load
                                local.tee 8
                                br_if 0 (;@14;)
                              end
                              local.get 10
                              i32.const 0
                              i32.store
                            end
                            local.get 6
                            i32.eqz
                            br_if 4 (;@8;)
                            block  ;; label = @13
                              local.get 0
                              local.get 7
                              i32.load offset=28
                              local.tee 9
                              i32.const 2
                              i32.shl
                              i32.add
                              local.tee 8
                              i32.load
                              local.get 7
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 6
                              i32.const 16
                              i32.const 20
                              local.get 6
                              i32.load offset=16
                              local.get 7
                              i32.eq
                              select
                              i32.add
                              local.get 1
                              i32.store
                              local.get 1
                              i32.eqz
                              br_if 5 (;@8;)
                              br 4 (;@9;)
                            end
                            local.get 8
                            local.get 1
                            i32.store
                            local.get 1
                            br_if 3 (;@9;)
                            local.get 0
                            local.get 0
                            i32.load offset=412
                            i32.const -2
                            local.get 9
                            i32.rotl
                            i32.and
                            i32.store offset=412
                            br 4 (;@8;)
                          end
                          local.get 1
                          i32.load offset=4
                          i32.const -8
                          i32.and
                          local.get 4
                          i32.sub
                          local.tee 8
                          local.get 3
                          local.get 8
                          local.get 3
                          i32.lt_u
                          local.tee 8
                          select
                          local.set 3
                          local.get 1
                          local.get 7
                          local.get 8
                          select
                          local.set 7
                          local.get 1
                          local.set 8
                          br 0 (;@11;)
                        end
                      end
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 0
                          i32.const 144
                          i32.add
                          local.tee 10
                          local.get 1
                          local.get 3
                          i32.shl
                          i32.const 2
                          local.get 3
                          i32.shl
                          local.tee 1
                          i32.const 0
                          local.get 1
                          i32.sub
                          i32.or
                          i32.and
                          i32.ctz
                          local.tee 8
                          i32.const 3
                          i32.shl
                          i32.add
                          local.tee 3
                          local.get 3
                          i32.load offset=8
                          local.tee 1
                          i32.load offset=8
                          local.tee 9
                          i32.eq
                          br_if 0 (;@11;)
                          local.get 9
                          local.get 3
                          i32.store offset=12
                          local.get 3
                          local.get 9
                          i32.store offset=8
                          br 1 (;@10;)
                        end
                        local.get 0
                        local.get 7
                        i32.const -2
                        local.get 8
                        i32.rotl
                        i32.and
                        i32.store offset=408
                      end
                      local.get 1
                      local.get 4
                      i32.const 3
                      i32.or
                      i32.store offset=4
                      local.get 1
                      local.get 4
                      i32.add
                      local.tee 9
                      local.get 8
                      i32.const 3
                      i32.shl
                      local.tee 3
                      local.get 4
                      i32.sub
                      local.tee 8
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 1
                      local.get 3
                      i32.add
                      local.get 8
                      i32.store
                      block  ;; label = @10
                        local.get 0
                        i32.load offset=416
                        local.tee 7
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 10
                        local.get 7
                        i32.const -8
                        i32.and
                        i32.add
                        local.set 3
                        local.get 0
                        i32.load offset=424
                        local.set 4
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 0
                            i32.load offset=408
                            local.tee 10
                            i32.const 1
                            local.get 7
                            i32.const 3
                            i32.shr_u
                            i32.shl
                            local.tee 7
                            i32.and
                            br_if 0 (;@12;)
                            local.get 0
                            local.get 10
                            local.get 7
                            i32.or
                            i32.store offset=408
                            local.get 3
                            local.set 7
                            br 1 (;@11;)
                          end
                          local.get 3
                          i32.load offset=8
                          local.set 7
                        end
                        local.get 3
                        local.get 4
                        i32.store offset=8
                        local.get 7
                        local.get 4
                        i32.store offset=12
                        local.get 4
                        local.get 3
                        i32.store offset=12
                        local.get 4
                        local.get 7
                        i32.store offset=8
                      end
                      local.get 1
                      i32.const 8
                      i32.add
                      local.set 3
                      local.get 0
                      local.get 9
                      i32.store offset=424
                      local.get 0
                      local.get 8
                      i32.store offset=416
                      br 8 (;@1;)
                    end
                    local.get 1
                    local.get 6
                    i32.store offset=24
                    block  ;; label = @9
                      local.get 7
                      i32.load offset=16
                      local.tee 8
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 1
                      local.get 8
                      i32.store offset=16
                      local.get 8
                      local.get 1
                      i32.store offset=24
                    end
                    local.get 7
                    i32.load offset=20
                    local.tee 8
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 1
                    local.get 8
                    i32.store offset=20
                    local.get 8
                    local.get 1
                    i32.store offset=24
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 3
                        i32.const 16
                        i32.lt_u
                        br_if 0 (;@10;)
                        local.get 7
                        local.get 4
                        i32.const 3
                        i32.or
                        i32.store offset=4
                        local.get 7
                        local.get 4
                        i32.add
                        local.tee 4
                        local.get 3
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 4
                        local.get 3
                        i32.add
                        local.get 3
                        i32.store
                        local.get 0
                        i32.load offset=416
                        local.tee 9
                        i32.eqz
                        br_if 1 (;@9;)
                        local.get 0
                        local.get 9
                        i32.const -8
                        i32.and
                        i32.add
                        i32.const 144
                        i32.add
                        local.set 8
                        local.get 0
                        i32.load offset=424
                        local.set 1
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 0
                            i32.load offset=408
                            local.tee 10
                            i32.const 1
                            local.get 9
                            i32.const 3
                            i32.shr_u
                            i32.shl
                            local.tee 9
                            i32.and
                            br_if 0 (;@12;)
                            local.get 0
                            local.get 10
                            local.get 9
                            i32.or
                            i32.store offset=408
                            local.get 8
                            local.set 9
                            br 1 (;@11;)
                          end
                          local.get 8
                          i32.load offset=8
                          local.set 9
                        end
                        local.get 8
                        local.get 1
                        i32.store offset=8
                        local.get 9
                        local.get 1
                        i32.store offset=12
                        local.get 1
                        local.get 8
                        i32.store offset=12
                        local.get 1
                        local.get 9
                        i32.store offset=8
                        br 1 (;@9;)
                      end
                      local.get 7
                      local.get 3
                      local.get 4
                      i32.add
                      local.tee 1
                      i32.const 3
                      i32.or
                      i32.store offset=4
                      local.get 7
                      local.get 1
                      i32.add
                      local.tee 1
                      local.get 1
                      i32.load offset=4
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      br 1 (;@8;)
                    end
                    local.get 0
                    local.get 4
                    i32.store offset=424
                    local.get 0
                    local.get 3
                    i32.store offset=416
                  end
                  local.get 7
                  i32.const 8
                  i32.add
                  local.set 3
                  br 6 (;@1;)
                end
                block  ;; label = @7
                  local.get 1
                  local.get 8
                  i32.or
                  br_if 0 (;@7;)
                  i32.const 0
                  local.set 8
                  i32.const 2
                  local.get 6
                  i32.shl
                  local.tee 1
                  i32.const 0
                  local.get 1
                  i32.sub
                  i32.or
                  local.get 5
                  i32.and
                  local.tee 1
                  i32.eqz
                  br_if 3 (;@4;)
                  local.get 0
                  local.get 1
                  i32.ctz
                  i32.const 2
                  i32.shl
                  i32.add
                  i32.load
                  local.set 1
                end
                local.get 1
                i32.eqz
                br_if 1 (;@5;)
              end
              loop  ;; label = @6
                local.get 1
                local.get 8
                local.get 1
                i32.load offset=4
                i32.const -8
                i32.and
                local.tee 7
                local.get 4
                i32.sub
                local.tee 10
                local.get 3
                i32.lt_u
                local.tee 6
                select
                local.set 5
                local.get 7
                local.get 4
                i32.lt_u
                local.set 9
                local.get 10
                local.get 3
                local.get 6
                select
                local.set 10
                block  ;; label = @7
                  local.get 1
                  i32.load offset=16
                  local.tee 7
                  br_if 0 (;@7;)
                  local.get 1
                  i32.load offset=20
                  local.set 7
                end
                local.get 8
                local.get 5
                local.get 9
                select
                local.set 8
                local.get 3
                local.get 10
                local.get 9
                select
                local.set 3
                local.get 7
                local.set 1
                local.get 7
                br_if 0 (;@6;)
              end
            end
            local.get 8
            i32.eqz
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 0
              i32.load offset=416
              local.tee 1
              local.get 4
              i32.lt_u
              br_if 0 (;@5;)
              local.get 3
              local.get 1
              local.get 4
              i32.sub
              i32.ge_u
              br_if 1 (;@4;)
            end
            local.get 8
            i32.load offset=24
            local.set 6
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 8
                  i32.load offset=12
                  local.tee 1
                  local.get 8
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const 20
                  i32.const 16
                  local.get 8
                  i32.load offset=20
                  local.tee 1
                  select
                  i32.add
                  i32.load
                  local.tee 7
                  br_if 1 (;@6;)
                  i32.const 0
                  local.set 1
                  br 2 (;@5;)
                end
                local.get 8
                i32.load offset=8
                local.tee 7
                local.get 1
                i32.store offset=12
                local.get 1
                local.get 7
                i32.store offset=8
                br 1 (;@5;)
              end
              local.get 8
              i32.const 20
              i32.add
              local.get 8
              i32.const 16
              i32.add
              local.get 1
              select
              local.set 9
              loop  ;; label = @6
                local.get 9
                local.set 10
                local.get 7
                local.tee 1
                i32.const 20
                i32.add
                local.get 1
                i32.const 16
                i32.add
                local.get 1
                i32.load offset=20
                local.tee 7
                select
                local.set 9
                local.get 1
                i32.const 20
                i32.const 16
                local.get 7
                select
                i32.add
                i32.load
                local.tee 7
                br_if 0 (;@6;)
              end
              local.get 10
              i32.const 0
              i32.store
            end
            local.get 6
            i32.eqz
            br_if 2 (;@2;)
            block  ;; label = @5
              local.get 0
              local.get 8
              i32.load offset=28
              local.tee 9
              i32.const 2
              i32.shl
              i32.add
              local.tee 7
              i32.load
              local.get 8
              i32.eq
              br_if 0 (;@5;)
              local.get 6
              i32.const 16
              i32.const 20
              local.get 6
              i32.load offset=16
              local.get 8
              i32.eq
              select
              i32.add
              local.get 1
              i32.store
              local.get 1
              i32.eqz
              br_if 3 (;@2;)
              br 2 (;@3;)
            end
            local.get 7
            local.get 1
            i32.store
            local.get 1
            br_if 1 (;@3;)
            local.get 0
            local.get 0
            i32.load offset=412
            i32.const -2
            local.get 9
            i32.rotl
            i32.and
            i32.store offset=412
            br 2 (;@2;)
          end
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 0
                      i32.load offset=416
                      local.tee 1
                      local.get 4
                      i32.ge_u
                      br_if 0 (;@9;)
                      block  ;; label = @10
                        local.get 0
                        i32.load offset=420
                        local.tee 1
                        local.get 4
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 2
                        i32.const 4
                        i32.add
                        local.get 0
                        i32.const 452
                        i32.add
                        local.get 4
                        i32.const 65583
                        i32.add
                        i32.const -65536
                        i32.and
                        call $_ZN61_$LT$dlmalloc..sys..System$u20$as$u20$dlmalloc..Allocator$GT$5alloc17h293f24278785f002E
                        i32.const 0
                        local.set 3
                        local.get 2
                        i32.load offset=4
                        local.tee 9
                        i32.eqz
                        br_if 9 (;@1;)
                        local.get 2
                        i32.load offset=12
                        local.set 11
                        local.get 0
                        local.get 0
                        i32.load offset=432
                        local.get 2
                        i32.load offset=8
                        local.tee 6
                        i32.add
                        local.tee 1
                        i32.store offset=432
                        local.get 0
                        local.get 0
                        i32.load offset=436
                        local.tee 8
                        local.get 1
                        local.get 8
                        local.get 1
                        i32.gt_u
                        select
                        i32.store offset=436
                        block  ;; label = @11
                          local.get 0
                          i32.load offset=428
                          local.tee 8
                          br_if 0 (;@11;)
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 0
                              i32.load offset=444
                              local.tee 1
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 9
                              local.get 1
                              i32.ge_u
                              br_if 1 (;@12;)
                            end
                            local.get 0
                            local.get 9
                            i32.store offset=444
                          end
                          local.get 0
                          i32.const 4095
                          i32.store offset=448
                          local.get 0
                          local.get 11
                          i32.store offset=140
                          local.get 0
                          local.get 6
                          i32.store offset=132
                          local.get 0
                          local.get 9
                          i32.store offset=128
                          local.get 0
                          local.get 0
                          i32.const 144
                          i32.add
                          local.tee 1
                          i32.store offset=156
                          local.get 0
                          local.get 0
                          i32.const 152
                          i32.add
                          local.tee 8
                          i32.store offset=164
                          local.get 0
                          local.get 1
                          i32.store offset=152
                          local.get 0
                          local.get 0
                          i32.const 160
                          i32.add
                          local.tee 1
                          i32.store offset=172
                          local.get 0
                          local.get 8
                          i32.store offset=160
                          local.get 0
                          local.get 0
                          i32.const 168
                          i32.add
                          local.tee 8
                          i32.store offset=180
                          local.get 0
                          local.get 1
                          i32.store offset=168
                          local.get 0
                          local.get 0
                          i32.const 176
                          i32.add
                          local.tee 1
                          i32.store offset=188
                          local.get 0
                          local.get 8
                          i32.store offset=176
                          local.get 0
                          local.get 0
                          i32.const 184
                          i32.add
                          local.tee 8
                          i32.store offset=196
                          local.get 0
                          local.get 1
                          i32.store offset=184
                          local.get 0
                          local.get 0
                          i32.const 192
                          i32.add
                          local.tee 1
                          i32.store offset=204
                          local.get 0
                          local.get 8
                          i32.store offset=192
                          local.get 0
                          local.get 0
                          i32.const 200
                          i32.add
                          local.tee 8
                          i32.store offset=212
                          local.get 0
                          local.get 1
                          i32.store offset=200
                          local.get 0
                          local.get 0
                          i32.const 208
                          i32.add
                          local.tee 1
                          i32.store offset=220
                          local.get 0
                          local.get 8
                          i32.store offset=208
                          local.get 0
                          local.get 1
                          i32.store offset=216
                          local.get 0
                          local.get 0
                          i32.const 216
                          i32.add
                          local.tee 1
                          i32.store offset=228
                          local.get 0
                          local.get 1
                          i32.store offset=224
                          local.get 0
                          local.get 0
                          i32.const 224
                          i32.add
                          local.tee 1
                          i32.store offset=236
                          local.get 0
                          local.get 1
                          i32.store offset=232
                          local.get 0
                          local.get 0
                          i32.const 232
                          i32.add
                          local.tee 1
                          i32.store offset=244
                          local.get 0
                          local.get 1
                          i32.store offset=240
                          local.get 0
                          local.get 0
                          i32.const 240
                          i32.add
                          local.tee 1
                          i32.store offset=252
                          local.get 0
                          local.get 1
                          i32.store offset=248
                          local.get 0
                          local.get 0
                          i32.const 248
                          i32.add
                          local.tee 1
                          i32.store offset=260
                          local.get 0
                          local.get 1
                          i32.store offset=256
                          local.get 0
                          local.get 0
                          i32.const 256
                          i32.add
                          local.tee 1
                          i32.store offset=268
                          local.get 0
                          local.get 1
                          i32.store offset=264
                          local.get 0
                          local.get 0
                          i32.const 264
                          i32.add
                          local.tee 1
                          i32.store offset=276
                          local.get 0
                          local.get 1
                          i32.store offset=272
                          local.get 0
                          local.get 0
                          i32.const 272
                          i32.add
                          local.tee 1
                          i32.store offset=284
                          local.get 0
                          local.get 0
                          i32.const 280
                          i32.add
                          local.tee 8
                          i32.store offset=292
                          local.get 0
                          local.get 1
                          i32.store offset=280
                          local.get 0
                          local.get 0
                          i32.const 288
                          i32.add
                          local.tee 1
                          i32.store offset=300
                          local.get 0
                          local.get 8
                          i32.store offset=288
                          local.get 0
                          local.get 0
                          i32.const 296
                          i32.add
                          local.tee 8
                          i32.store offset=308
                          local.get 0
                          local.get 1
                          i32.store offset=296
                          local.get 0
                          local.get 0
                          i32.const 304
                          i32.add
                          local.tee 1
                          i32.store offset=316
                          local.get 0
                          local.get 8
                          i32.store offset=304
                          local.get 0
                          local.get 0
                          i32.const 312
                          i32.add
                          local.tee 8
                          i32.store offset=324
                          local.get 0
                          local.get 1
                          i32.store offset=312
                          local.get 0
                          local.get 0
                          i32.const 320
                          i32.add
                          local.tee 1
                          i32.store offset=332
                          local.get 0
                          local.get 8
                          i32.store offset=320
                          local.get 0
                          local.get 0
                          i32.const 328
                          i32.add
                          local.tee 8
                          i32.store offset=340
                          local.get 0
                          local.get 1
                          i32.store offset=328
                          local.get 0
                          local.get 0
                          i32.const 336
                          i32.add
                          local.tee 1
                          i32.store offset=348
                          local.get 0
                          local.get 8
                          i32.store offset=336
                          local.get 0
                          local.get 0
                          i32.const 344
                          i32.add
                          local.tee 8
                          i32.store offset=356
                          local.get 0
                          local.get 1
                          i32.store offset=344
                          local.get 0
                          local.get 0
                          i32.const 352
                          i32.add
                          local.tee 1
                          i32.store offset=364
                          local.get 0
                          local.get 8
                          i32.store offset=352
                          local.get 0
                          local.get 0
                          i32.const 360
                          i32.add
                          local.tee 8
                          i32.store offset=372
                          local.get 0
                          local.get 1
                          i32.store offset=360
                          local.get 0
                          local.get 0
                          i32.const 368
                          i32.add
                          local.tee 1
                          i32.store offset=380
                          local.get 0
                          local.get 8
                          i32.store offset=368
                          local.get 0
                          local.get 0
                          i32.const 376
                          i32.add
                          local.tee 8
                          i32.store offset=388
                          local.get 0
                          local.get 1
                          i32.store offset=376
                          local.get 0
                          local.get 0
                          i32.const 384
                          i32.add
                          local.tee 1
                          i32.store offset=396
                          local.get 0
                          local.get 8
                          i32.store offset=384
                          local.get 0
                          local.get 0
                          i32.const 392
                          i32.add
                          local.tee 8
                          i32.store offset=404
                          local.get 0
                          local.get 1
                          i32.store offset=392
                          local.get 0
                          local.get 8
                          i32.store offset=400
                          local.get 0
                          local.get 9
                          i32.const 15
                          i32.add
                          i32.const -8
                          i32.and
                          local.tee 1
                          i32.const -8
                          i32.add
                          local.tee 8
                          i32.store offset=428
                          local.get 8
                          local.get 9
                          local.get 1
                          i32.sub
                          local.get 6
                          i32.const -40
                          i32.add
                          local.tee 1
                          i32.add
                          i32.const 8
                          i32.add
                          local.tee 7
                          i32.const 1
                          i32.or
                          i32.store offset=4
                          local.get 0
                          local.get 7
                          i32.store offset=420
                          local.get 9
                          local.get 1
                          i32.add
                          i32.const 40
                          i32.store offset=4
                          local.get 0
                          i32.const 2097152
                          i32.store offset=440
                          br 7 (;@4;)
                        end
                        local.get 0
                        i32.const 128
                        i32.add
                        local.tee 5
                        local.set 1
                        block  ;; label = @11
                          block  ;; label = @12
                            loop  ;; label = @13
                              local.get 9
                              local.get 1
                              i32.load
                              local.tee 7
                              local.get 1
                              i32.load offset=4
                              local.tee 10
                              i32.add
                              i32.eq
                              br_if 1 (;@12;)
                              local.get 1
                              i32.load offset=8
                              local.tee 1
                              br_if 0 (;@13;)
                              br 2 (;@11;)
                            end
                          end
                          local.get 8
                          local.get 9
                          i32.ge_u
                          br_if 0 (;@11;)
                          local.get 7
                          local.get 8
                          i32.gt_u
                          br_if 0 (;@11;)
                          local.get 1
                          i32.load offset=12
                          local.tee 7
                          i32.const 1
                          i32.and
                          br_if 0 (;@11;)
                          local.get 7
                          i32.const 1
                          i32.shr_u
                          local.get 11
                          i32.eq
                          br_if 3 (;@8;)
                        end
                        local.get 0
                        local.get 0
                        i32.load offset=444
                        local.tee 1
                        local.get 9
                        local.get 9
                        local.get 1
                        i32.gt_u
                        select
                        i32.store offset=444
                        local.get 9
                        local.get 6
                        i32.add
                        local.set 7
                        local.get 5
                        local.set 1
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              loop  ;; label = @14
                                local.get 1
                                i32.load
                                local.get 7
                                i32.eq
                                br_if 1 (;@13;)
                                local.get 1
                                i32.load offset=8
                                local.tee 1
                                br_if 0 (;@14;)
                                br 2 (;@12;)
                              end
                            end
                            local.get 1
                            i32.load offset=12
                            local.tee 10
                            i32.const 1
                            i32.and
                            br_if 0 (;@12;)
                            local.get 10
                            i32.const 1
                            i32.shr_u
                            local.get 11
                            i32.eq
                            br_if 1 (;@11;)
                          end
                          local.get 5
                          local.set 1
                          block  ;; label = @12
                            loop  ;; label = @13
                              block  ;; label = @14
                                local.get 1
                                i32.load
                                local.tee 7
                                local.get 8
                                i32.gt_u
                                br_if 0 (;@14;)
                                local.get 7
                                local.get 1
                                i32.load offset=4
                                i32.add
                                local.tee 7
                                local.get 8
                                i32.gt_u
                                br_if 2 (;@12;)
                              end
                              local.get 1
                              i32.load offset=8
                              local.set 1
                              br 0 (;@13;)
                            end
                          end
                          local.get 9
                          i32.const 15
                          i32.add
                          i32.const -8
                          i32.and
                          local.tee 1
                          i32.const -8
                          i32.add
                          local.tee 12
                          local.get 9
                          local.get 1
                          i32.sub
                          local.get 6
                          i32.const -40
                          i32.add
                          local.tee 1
                          i32.add
                          i32.const 8
                          i32.add
                          local.tee 13
                          i32.const 1
                          i32.or
                          i32.store offset=4
                          local.get 9
                          local.get 1
                          i32.add
                          i32.const 40
                          i32.store offset=4
                          local.get 8
                          local.get 7
                          i32.const -32
                          i32.add
                          i32.const -8
                          i32.and
                          i32.const -8
                          i32.add
                          local.tee 1
                          local.get 1
                          local.get 8
                          i32.const 16
                          i32.add
                          i32.lt_u
                          select
                          local.tee 10
                          i32.const 27
                          i32.store offset=4
                          local.get 0
                          i32.const 2097152
                          i32.store offset=440
                          local.get 0
                          local.get 12
                          i32.store offset=428
                          local.get 0
                          local.get 13
                          i32.store offset=420
                          local.get 5
                          i64.load align=4
                          local.set 14
                          local.get 10
                          i32.const 16
                          i32.add
                          local.get 5
                          i32.const 8
                          i32.add
                          i64.load align=4
                          i64.store align=4
                          local.get 10
                          local.get 14
                          i64.store offset=8 align=4
                          local.get 0
                          local.get 11
                          i32.store offset=140
                          local.get 0
                          local.get 6
                          i32.store offset=132
                          local.get 0
                          local.get 9
                          i32.store offset=128
                          local.get 0
                          local.get 10
                          i32.const 8
                          i32.add
                          i32.store offset=136
                          local.get 10
                          i32.const 28
                          i32.add
                          local.set 1
                          loop  ;; label = @12
                            local.get 1
                            i32.const 7
                            i32.store
                            local.get 1
                            i32.const 4
                            i32.add
                            local.tee 1
                            local.get 7
                            i32.lt_u
                            br_if 0 (;@12;)
                          end
                          local.get 10
                          local.get 8
                          i32.eq
                          br_if 7 (;@4;)
                          local.get 10
                          local.get 10
                          i32.load offset=4
                          i32.const -2
                          i32.and
                          i32.store offset=4
                          local.get 8
                          local.get 10
                          local.get 8
                          i32.sub
                          local.tee 1
                          i32.const 1
                          i32.or
                          i32.store offset=4
                          local.get 10
                          local.get 1
                          i32.store
                          block  ;; label = @12
                            local.get 1
                            i32.const 256
                            i32.lt_u
                            br_if 0 (;@12;)
                            local.get 0
                            local.get 8
                            local.get 1
                            call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h73476a47273f3bb9E
                            br 8 (;@4;)
                          end
                          local.get 0
                          local.get 1
                          i32.const -8
                          i32.and
                          i32.add
                          i32.const 144
                          i32.add
                          local.set 7
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 0
                              i32.load offset=408
                              local.tee 9
                              i32.const 1
                              local.get 1
                              i32.const 3
                              i32.shr_u
                              i32.shl
                              local.tee 1
                              i32.and
                              br_if 0 (;@13;)
                              local.get 0
                              local.get 9
                              local.get 1
                              i32.or
                              i32.store offset=408
                              local.get 7
                              local.set 1
                              br 1 (;@12;)
                            end
                            local.get 7
                            i32.load offset=8
                            local.set 1
                          end
                          local.get 7
                          local.get 8
                          i32.store offset=8
                          local.get 1
                          local.get 8
                          i32.store offset=12
                          local.get 8
                          local.get 7
                          i32.store offset=12
                          local.get 8
                          local.get 1
                          i32.store offset=8
                          br 7 (;@4;)
                        end
                        local.get 1
                        local.get 9
                        i32.store
                        local.get 1
                        local.get 1
                        i32.load offset=4
                        local.get 6
                        i32.add
                        i32.store offset=4
                        local.get 9
                        i32.const 15
                        i32.add
                        i32.const -8
                        i32.and
                        i32.const -8
                        i32.add
                        local.tee 8
                        local.get 4
                        i32.const 3
                        i32.or
                        i32.store offset=4
                        local.get 7
                        i32.const 15
                        i32.add
                        i32.const -8
                        i32.and
                        i32.const -8
                        i32.add
                        local.tee 3
                        local.get 8
                        local.get 4
                        i32.add
                        local.tee 1
                        i32.sub
                        local.set 4
                        local.get 3
                        local.get 0
                        i32.load offset=428
                        i32.eq
                        br_if 3 (;@7;)
                        local.get 3
                        local.get 0
                        i32.load offset=424
                        i32.eq
                        br_if 4 (;@6;)
                        block  ;; label = @11
                          local.get 3
                          i32.load offset=4
                          local.tee 7
                          i32.const 3
                          i32.and
                          i32.const 1
                          i32.ne
                          br_if 0 (;@11;)
                          local.get 0
                          local.get 3
                          local.get 7
                          i32.const -8
                          i32.and
                          local.tee 7
                          call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h8a5b56aa007b533cE
                          local.get 7
                          local.get 4
                          i32.add
                          local.set 4
                          local.get 3
                          local.get 7
                          i32.add
                          local.tee 3
                          i32.load offset=4
                          local.set 7
                        end
                        local.get 3
                        local.get 7
                        i32.const -2
                        i32.and
                        i32.store offset=4
                        local.get 1
                        local.get 4
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 1
                        local.get 4
                        i32.add
                        local.get 4
                        i32.store
                        block  ;; label = @11
                          local.get 4
                          i32.const 256
                          i32.lt_u
                          br_if 0 (;@11;)
                          local.get 0
                          local.get 1
                          local.get 4
                          call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h73476a47273f3bb9E
                          br 6 (;@5;)
                        end
                        local.get 0
                        local.get 4
                        i32.const -8
                        i32.and
                        i32.add
                        i32.const 144
                        i32.add
                        local.set 3
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 0
                            i32.load offset=408
                            local.tee 7
                            i32.const 1
                            local.get 4
                            i32.const 3
                            i32.shr_u
                            i32.shl
                            local.tee 4
                            i32.and
                            br_if 0 (;@12;)
                            local.get 0
                            local.get 7
                            local.get 4
                            i32.or
                            i32.store offset=408
                            local.get 3
                            local.set 4
                            br 1 (;@11;)
                          end
                          local.get 3
                          i32.load offset=8
                          local.set 4
                        end
                        local.get 3
                        local.get 1
                        i32.store offset=8
                        local.get 4
                        local.get 1
                        i32.store offset=12
                        local.get 1
                        local.get 3
                        i32.store offset=12
                        local.get 1
                        local.get 4
                        i32.store offset=8
                        br 5 (;@5;)
                      end
                      local.get 0
                      local.get 1
                      local.get 4
                      i32.sub
                      local.tee 3
                      i32.store offset=420
                      local.get 0
                      local.get 0
                      i32.load offset=428
                      local.tee 1
                      local.get 4
                      i32.add
                      local.tee 8
                      i32.store offset=428
                      local.get 8
                      local.get 3
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 1
                      local.get 4
                      i32.const 3
                      i32.or
                      i32.store offset=4
                      local.get 1
                      i32.const 8
                      i32.add
                      local.set 3
                      br 8 (;@1;)
                    end
                    local.get 0
                    i32.load offset=424
                    local.set 3
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 1
                        local.get 4
                        i32.sub
                        local.tee 8
                        i32.const 15
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 0
                        i32.const 0
                        i32.store offset=424
                        local.get 0
                        i32.const 0
                        i32.store offset=416
                        local.get 3
                        local.get 1
                        i32.const 3
                        i32.or
                        i32.store offset=4
                        local.get 3
                        local.get 1
                        i32.add
                        local.tee 1
                        local.get 1
                        i32.load offset=4
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        br 1 (;@9;)
                      end
                      local.get 0
                      local.get 8
                      i32.store offset=416
                      local.get 0
                      local.get 3
                      local.get 4
                      i32.add
                      local.tee 7
                      i32.store offset=424
                      local.get 7
                      local.get 8
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 3
                      local.get 1
                      i32.add
                      local.get 8
                      i32.store
                      local.get 3
                      local.get 4
                      i32.const 3
                      i32.or
                      i32.store offset=4
                    end
                    local.get 3
                    i32.const 8
                    i32.add
                    local.set 3
                    br 7 (;@1;)
                  end
                  local.get 1
                  local.get 10
                  local.get 6
                  i32.add
                  i32.store offset=4
                  local.get 0
                  i32.load offset=428
                  local.tee 1
                  i32.const 15
                  i32.add
                  i32.const -8
                  i32.and
                  local.tee 8
                  i32.const -8
                  i32.add
                  local.tee 7
                  local.get 1
                  local.get 8
                  i32.sub
                  local.get 0
                  i32.load offset=420
                  local.get 6
                  i32.add
                  local.tee 8
                  i32.add
                  i32.const 8
                  i32.add
                  local.tee 9
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 0
                  i32.const 2097152
                  i32.store offset=440
                  local.get 0
                  local.get 7
                  i32.store offset=428
                  local.get 0
                  local.get 9
                  i32.store offset=420
                  local.get 1
                  local.get 8
                  i32.add
                  i32.const 40
                  i32.store offset=4
                  br 3 (;@4;)
                end
                local.get 0
                local.get 1
                i32.store offset=428
                local.get 0
                local.get 0
                i32.load offset=420
                local.get 4
                i32.add
                local.tee 4
                i32.store offset=420
                local.get 1
                local.get 4
                i32.const 1
                i32.or
                i32.store offset=4
                br 1 (;@5;)
              end
              local.get 1
              local.get 0
              i32.load offset=416
              local.get 4
              i32.add
              local.tee 4
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 0
              local.get 1
              i32.store offset=424
              local.get 0
              local.get 4
              i32.store offset=416
              local.get 1
              local.get 4
              i32.add
              local.get 4
              i32.store
            end
            local.get 8
            i32.const 8
            i32.add
            local.set 3
            br 3 (;@1;)
          end
          local.get 0
          i32.load offset=420
          local.tee 1
          local.get 4
          i32.le_u
          br_if 2 (;@1;)
          local.get 0
          local.get 1
          local.get 4
          i32.sub
          local.tee 3
          i32.store offset=420
          local.get 0
          local.get 0
          i32.load offset=428
          local.tee 1
          local.get 4
          i32.add
          local.tee 8
          i32.store offset=428
          local.get 8
          local.get 3
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 1
          local.get 4
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 1
          i32.const 8
          i32.add
          local.set 3
          br 2 (;@1;)
        end
        local.get 1
        local.get 6
        i32.store offset=24
        block  ;; label = @3
          local.get 8
          i32.load offset=16
          local.tee 7
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          local.get 7
          i32.store offset=16
          local.get 7
          local.get 1
          i32.store offset=24
        end
        local.get 8
        i32.load offset=20
        local.tee 7
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 7
        i32.store offset=20
        local.get 7
        local.get 1
        i32.store offset=24
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 8
          local.get 4
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 8
          local.get 4
          i32.add
          local.tee 1
          local.get 3
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 1
          local.get 3
          i32.add
          local.get 3
          i32.store
          block  ;; label = @4
            local.get 3
            i32.const 256
            i32.lt_u
            br_if 0 (;@4;)
            local.get 0
            local.get 1
            local.get 3
            call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h73476a47273f3bb9E
            br 2 (;@2;)
          end
          local.get 0
          local.get 3
          i32.const -8
          i32.and
          i32.add
          i32.const 144
          i32.add
          local.set 4
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.load offset=408
              local.tee 7
              i32.const 1
              local.get 3
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 3
              i32.and
              br_if 0 (;@5;)
              local.get 0
              local.get 7
              local.get 3
              i32.or
              i32.store offset=408
              local.get 4
              local.set 3
              br 1 (;@4;)
            end
            local.get 4
            i32.load offset=8
            local.set 3
          end
          local.get 4
          local.get 1
          i32.store offset=8
          local.get 3
          local.get 1
          i32.store offset=12
          local.get 1
          local.get 4
          i32.store offset=12
          local.get 1
          local.get 3
          i32.store offset=8
          br 1 (;@2;)
        end
        local.get 8
        local.get 3
        local.get 4
        i32.add
        local.tee 1
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 8
        local.get 1
        i32.add
        local.tee 1
        local.get 1
        i32.load offset=4
        i32.const 1
        i32.or
        i32.store offset=4
      end
      local.get 8
      i32.const 8
      i32.add
      local.set 3
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 3)
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$7realloc17hb891c38c98b4199eE (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    i32.const 0
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const -65588
        i32.gt_u
        br_if 0 (;@2;)
        i32.const 16
        local.get 2
        i32.const 11
        i32.add
        i32.const -8
        i32.and
        local.get 2
        i32.const 11
        i32.lt_u
        select
        local.set 4
        local.get 1
        i32.const -4
        i32.add
        local.tee 5
        i32.load
        local.tee 6
        i32.const -8
        i32.and
        local.set 7
        block  ;; label = @3
          block  ;; label = @4
            local.get 6
            i32.const 3
            i32.and
            br_if 0 (;@4;)
            local.get 4
            i32.const 256
            i32.lt_u
            br_if 1 (;@3;)
            local.get 7
            local.get 4
            i32.const 4
            i32.or
            i32.lt_u
            br_if 1 (;@3;)
            local.get 7
            local.get 4
            i32.sub
            i32.const 131073
            i32.ge_u
            br_if 1 (;@3;)
            local.get 1
            return
          end
          local.get 1
          i32.const -8
          i32.add
          local.tee 8
          local.get 7
          i32.add
          local.set 9
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 7
                    local.get 4
                    i32.ge_u
                    br_if 0 (;@8;)
                    local.get 9
                    local.get 0
                    i32.load offset=428
                    i32.eq
                    br_if 4 (;@4;)
                    local.get 9
                    local.get 0
                    i32.load offset=424
                    i32.eq
                    br_if 2 (;@6;)
                    local.get 9
                    i32.load offset=4
                    local.tee 6
                    i32.const 2
                    i32.and
                    br_if 5 (;@3;)
                    local.get 6
                    i32.const -8
                    i32.and
                    local.tee 6
                    local.get 7
                    i32.add
                    local.tee 7
                    local.get 4
                    i32.lt_u
                    br_if 5 (;@3;)
                    local.get 0
                    local.get 9
                    local.get 6
                    call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h8a5b56aa007b533cE
                    local.get 7
                    local.get 4
                    i32.sub
                    local.tee 2
                    i32.const 16
                    i32.lt_u
                    br_if 1 (;@7;)
                    local.get 5
                    local.get 4
                    local.get 5
                    i32.load
                    i32.const 1
                    i32.and
                    i32.or
                    i32.const 2
                    i32.or
                    i32.store
                    local.get 8
                    local.get 4
                    i32.add
                    local.tee 3
                    local.get 2
                    i32.const 3
                    i32.or
                    i32.store offset=4
                    local.get 8
                    local.get 7
                    i32.add
                    local.tee 4
                    local.get 4
                    i32.load offset=4
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    local.get 0
                    local.get 3
                    local.get 2
                    call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17hc73bbef596940e15E.llvm.14233881234370288605
                    local.get 1
                    return
                  end
                  local.get 7
                  local.get 4
                  i32.sub
                  local.tee 2
                  i32.const 15
                  i32.gt_u
                  br_if 2 (;@5;)
                  local.get 1
                  return
                end
                local.get 5
                local.get 7
                local.get 5
                i32.load
                i32.const 1
                i32.and
                i32.or
                i32.const 2
                i32.or
                i32.store
                local.get 8
                local.get 7
                i32.add
                local.tee 2
                local.get 2
                i32.load offset=4
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 1
                return
              end
              local.get 0
              i32.load offset=416
              local.get 7
              i32.add
              local.tee 7
              local.get 4
              i32.lt_u
              br_if 2 (;@3;)
              block  ;; label = @6
                block  ;; label = @7
                  local.get 7
                  local.get 4
                  i32.sub
                  local.tee 2
                  i32.const 15
                  i32.gt_u
                  br_if 0 (;@7;)
                  local.get 5
                  local.get 6
                  i32.const 1
                  i32.and
                  local.get 7
                  i32.or
                  i32.const 2
                  i32.or
                  i32.store
                  local.get 8
                  local.get 7
                  i32.add
                  local.tee 2
                  local.get 2
                  i32.load offset=4
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  i32.const 0
                  local.set 2
                  i32.const 0
                  local.set 3
                  br 1 (;@6;)
                end
                local.get 5
                local.get 4
                local.get 6
                i32.const 1
                i32.and
                i32.or
                i32.const 2
                i32.or
                i32.store
                local.get 8
                local.get 4
                i32.add
                local.tee 3
                local.get 2
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 8
                local.get 7
                i32.add
                local.tee 4
                local.get 2
                i32.store
                local.get 4
                local.get 4
                i32.load offset=4
                i32.const -2
                i32.and
                i32.store offset=4
              end
              local.get 0
              local.get 3
              i32.store offset=424
              local.get 0
              local.get 2
              i32.store offset=416
              local.get 1
              return
            end
            local.get 5
            local.get 4
            local.get 6
            i32.const 1
            i32.and
            i32.or
            i32.const 2
            i32.or
            i32.store
            local.get 8
            local.get 4
            i32.add
            local.tee 3
            local.get 2
            i32.const 3
            i32.or
            i32.store offset=4
            local.get 9
            local.get 9
            i32.load offset=4
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            local.get 3
            local.get 2
            call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17hc73bbef596940e15E.llvm.14233881234370288605
            local.get 1
            return
          end
          local.get 0
          i32.load offset=420
          local.get 7
          i32.add
          local.tee 7
          local.get 4
          i32.gt_u
          br_if 2 (;@1;)
        end
        local.get 0
        local.get 2
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17h0a666368b1102bfeE
        local.tee 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        local.get 1
        i32.const -4
        i32.const -8
        local.get 5
        i32.load
        local.tee 3
        i32.const 3
        i32.and
        select
        local.get 3
        i32.const -8
        i32.and
        i32.add
        local.tee 3
        local.get 2
        local.get 3
        local.get 2
        i32.lt_u
        select
        memory.copy
        local.get 0
        local.get 1
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$4free17hc03c95c3cec481e0E
        local.get 4
        local.set 3
      end
      local.get 3
      return
    end
    local.get 5
    local.get 4
    local.get 6
    i32.const 1
    i32.and
    i32.or
    i32.const 2
    i32.or
    i32.store
    local.get 0
    local.get 8
    local.get 4
    i32.add
    local.tee 2
    i32.store offset=428
    local.get 0
    local.get 7
    local.get 4
    i32.sub
    local.tee 3
    i32.store offset=420
    local.get 2
    local.get 3
    i32.const 1
    i32.or
    i32.store offset=4
    local.get 1)
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$8memalign17h3ff45824ebb127ccE (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    i32.const 0
    local.set 3
    block  ;; label = @1
      i32.const -65587
      local.get 1
      i32.const 16
      local.get 1
      i32.const 16
      i32.gt_u
      select
      local.tee 1
      i32.sub
      local.get 2
      i32.le_u
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i32.const 16
      local.get 2
      i32.const 11
      i32.add
      i32.const -8
      i32.and
      local.get 2
      i32.const 11
      i32.lt_u
      select
      local.tee 4
      i32.add
      i32.const 12
      i32.add
      call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17h0a666368b1102bfeE
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const -8
      i32.add
      local.set 3
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.const -1
          i32.add
          local.tee 5
          local.get 2
          i32.and
          br_if 0 (;@3;)
          local.get 3
          local.set 1
          br 1 (;@2;)
        end
        local.get 2
        i32.const -4
        i32.add
        local.tee 6
        i32.load
        local.tee 7
        i32.const -8
        i32.and
        local.get 5
        local.get 2
        i32.add
        i32.const 0
        local.get 1
        i32.sub
        i32.and
        i32.const -8
        i32.add
        local.tee 2
        i32.const 0
        local.get 1
        local.get 2
        local.get 3
        i32.sub
        i32.const 16
        i32.gt_u
        select
        i32.add
        local.tee 1
        local.get 3
        i32.sub
        local.tee 2
        i32.sub
        local.set 5
        block  ;; label = @3
          local.get 7
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          local.get 5
          local.get 1
          i32.load offset=4
          i32.const 1
          i32.and
          i32.or
          i32.const 2
          i32.or
          i32.store offset=4
          local.get 1
          local.get 5
          i32.add
          local.tee 5
          local.get 5
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 6
          local.get 2
          local.get 6
          i32.load
          i32.const 1
          i32.and
          i32.or
          i32.const 2
          i32.or
          i32.store
          local.get 3
          local.get 2
          i32.add
          local.tee 5
          local.get 5
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          local.get 3
          local.get 2
          call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17hc73bbef596940e15E.llvm.14233881234370288605
          br 1 (;@2;)
        end
        local.get 3
        i32.load
        local.set 3
        local.get 1
        local.get 5
        i32.store offset=4
        local.get 1
        local.get 3
        local.get 2
        i32.add
        i32.store
      end
      block  ;; label = @2
        local.get 1
        i32.load offset=4
        local.tee 2
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.const -8
        i32.and
        local.tee 3
        local.get 4
        i32.const 16
        i32.add
        i32.le_u
        br_if 0 (;@2;)
        local.get 1
        local.get 4
        local.get 2
        i32.const 1
        i32.and
        i32.or
        i32.const 2
        i32.or
        i32.store offset=4
        local.get 1
        local.get 4
        i32.add
        local.tee 2
        local.get 3
        local.get 4
        i32.sub
        local.tee 4
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 1
        local.get 3
        i32.add
        local.tee 3
        local.get 3
        i32.load offset=4
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 0
        local.get 2
        local.get 4
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17hc73bbef596940e15E.llvm.14233881234370288605
      end
      local.get 1
      i32.const 8
      i32.add
      local.set 3
    end
    local.get 3)
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h6e31f183a6d51aa5E (type 1) (param i32 i32)
    local.get 0
    i64.const 9220376746919867076
    i64.store offset=8
    local.get 0
    i64.const 395955473643699580
    i64.store)
  (func $_ZN4core3fmt5Write9write_fmt17hfacdb15f35c6f2c4E (type 2) (param i32 i32) (result i32)
    local.get 0
    i32.const 1052532
    local.get 1
    call $_ZN4core3fmt5write17h55b62ec8489b4effE)
  (func $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h3bceb8e6c5131c36E.1 (type 0) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end)
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17had9e027a1aa3b2ccE.3 (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const 0
            i32.store offset=12
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            block  ;; label = @5
              local.get 1
              i32.const 65536
              i32.ge_u
              br_if 0 (;@5;)
              local.get 2
              local.get 1
              i32.const 12
              i32.shr_u
              i32.const 224
              i32.or
              i32.store8 offset=12
              local.get 2
              local.get 1
              i32.const 6
              i32.shr_u
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=13
              i32.const 3
              local.set 3
              i32.const 2
              local.set 4
              br 3 (;@2;)
            end
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            local.get 2
            local.get 1
            i32.const 18
            i32.shr_u
            i32.const 7
            i32.and
            i32.const 240
            i32.or
            i32.store8 offset=12
            i32.const 4
            local.set 3
            i32.const 3
            local.set 4
            br 2 (;@2;)
          end
          block  ;; label = @4
            local.get 0
            i32.load offset=8
            local.tee 3
            local.get 0
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 0
            local.get 3
            call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17h322ca40853dbe2e1E
            local.get 0
            i32.load offset=8
            local.set 3
          end
          local.get 0
          i32.load offset=4
          local.get 3
          i32.add
          local.get 1
          i32.store8
          local.get 0
          local.get 0
          i32.load offset=8
          i32.const 1
          i32.add
          i32.store offset=8
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 3
        i32.const 1
        local.set 4
      end
      local.get 2
      i32.const 12
      i32.add
      local.get 4
      i32.or
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8
      block  ;; label = @2
        local.get 0
        i32.load
        local.get 0
        i32.load offset=8
        local.tee 1
        i32.sub
        local.get 3
        i32.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        local.get 3
        call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17ha8d8870fa1fd559bE
        local.get 0
        i32.load offset=8
        local.set 1
      end
      local.get 0
      i32.load offset=4
      local.get 1
      i32.add
      local.get 2
      i32.const 12
      i32.add
      local.get 3
      memory.copy
      local.get 0
      local.get 1
      local.get 3
      i32.add
      i32.store offset=8
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    i32.const 0)
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h52d87c11c795cdddE.3 (type 3) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.get 0
      i32.load offset=8
      local.tee 3
      i32.sub
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 2
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17ha8d8870fa1fd559bE
      local.get 0
      i32.load offset=8
      local.set 3
    end
    local.get 0
    i32.load offset=4
    local.get 3
    i32.add
    local.get 1
    local.get 2
    memory.copy
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0)
  (func $__rdl_alloc (type 2) (param i32 i32) (result i32)
    loop  ;; label = @1
      i32.const 0
      i32.const 1
      i32.atomic.rmw.xchg offset=1054016
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 9
        i32.lt_u
        br_if 0 (;@2;)
        i32.const 1054020
        local.get 1
        local.get 0
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$8memalign17h3ff45824ebb127ccE
        local.set 1
        br 1 (;@1;)
      end
      i32.const 1054020
      local.get 0
      call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17h0a666368b1102bfeE
      local.set 1
    end
    i32.const 0
    i32.const 0
    i32.atomic.rmw.xchg offset=1054016
    drop
    local.get 1)
  (func $__rdl_dealloc (type 6) (param i32 i32 i32)
    (local i32 i32)
    loop  ;; label = @1
      i32.const 0
      i32.const 1
      i32.atomic.rmw.xchg offset=1054016
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const -4
        i32.add
        i32.load
        local.tee 3
        i32.const -8
        i32.and
        local.tee 4
        i32.const 4
        i32.const 8
        local.get 3
        i32.const 3
        i32.and
        local.tee 3
        select
        local.get 1
        i32.add
        i32.lt_u
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 1
          i32.const 39
          i32.add
          i32.gt_u
          br_if 2 (;@1;)
        end
        i32.const 1054020
        local.get 0
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$4free17hc03c95c3cec481e0E
        i32.const 0
        i32.const 0
        i32.atomic.rmw.xchg offset=1054016
        drop
        return
      end
      i32.const 1052406
      i32.const 46
      i32.const 1052452
      call $_ZN4core9panicking5panic17h5183d2125e960738E
      unreachable
    end
    i32.const 1052468
    i32.const 46
    i32.const 1052516
    call $_ZN4core9panicking5panic17h5183d2125e960738E
    unreachable)
  (func $__rdl_realloc (type 8) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32)
    loop  ;; label = @1
      i32.const 0
      i32.const 1
      i32.atomic.rmw.xchg offset=1054016
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.const -4
            i32.add
            local.tee 4
            i32.load
            local.tee 5
            i32.const -8
            i32.and
            local.tee 6
            i32.const 4
            i32.const 8
            local.get 5
            i32.const 3
            i32.and
            local.tee 5
            select
            local.get 1
            i32.add
            i32.lt_u
            br_if 0 (;@4;)
            local.get 1
            i32.const 39
            i32.add
            local.set 7
            block  ;; label = @5
              local.get 5
              i32.eqz
              br_if 0 (;@5;)
              local.get 6
              local.get 7
              i32.gt_u
              br_if 2 (;@3;)
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 2
                  i32.const 9
                  i32.lt_u
                  br_if 0 (;@7;)
                  i32.const 1054020
                  local.get 2
                  local.get 3
                  call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$8memalign17h3ff45824ebb127ccE
                  local.tee 2
                  br_if 1 (;@6;)
                  i32.const 0
                  local.set 2
                  br 2 (;@5;)
                end
                i32.const 1054020
                local.get 0
                local.get 3
                call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$7realloc17hb891c38c98b4199eE
                local.set 2
                br 1 (;@5;)
              end
              local.get 2
              local.get 0
              local.get 1
              local.get 3
              local.get 1
              local.get 3
              i32.lt_u
              select
              memory.copy
              local.get 4
              i32.load
              local.tee 3
              i32.const -8
              i32.and
              local.tee 5
              i32.const 4
              i32.const 8
              local.get 3
              i32.const 3
              i32.and
              local.tee 3
              select
              local.get 1
              i32.add
              i32.lt_u
              br_if 3 (;@2;)
              block  ;; label = @6
                local.get 3
                i32.eqz
                br_if 0 (;@6;)
                local.get 5
                local.get 7
                i32.gt_u
                br_if 5 (;@1;)
              end
              i32.const 1054020
              local.get 0
              call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$4free17hc03c95c3cec481e0E
            end
            i32.const 0
            i32.const 0
            i32.atomic.rmw.xchg offset=1054016
            drop
            local.get 2
            return
          end
          i32.const 1052406
          i32.const 46
          i32.const 1052452
          call $_ZN4core9panicking5panic17h5183d2125e960738E
          unreachable
        end
        i32.const 1052468
        i32.const 46
        i32.const 1052516
        call $_ZN4core9panicking5panic17h5183d2125e960738E
        unreachable
      end
      i32.const 1052406
      i32.const 46
      i32.const 1052452
      call $_ZN4core9panicking5panic17h5183d2125e960738E
      unreachable
    end
    i32.const 1052468
    i32.const 46
    i32.const 1052516
    call $_ZN4core9panicking5panic17h5183d2125e960738E
    unreachable)
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17ha7f99a7273f54626E (type 1) (param i32 i32)
    local.get 0
    i64.const -5918158352840079641
    i64.store offset=8
    local.get 0
    i64.const 439319701636951332
    i64.store)
  (func $_ZN5alloc7raw_vec11finish_grow17hb321f6aada7cc474E.llvm.8415571176415214293 (type 7) (param i32 i32 i32 i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          i32.const 0
          i32.lt_s
          br_if 1 (;@2;)
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.load offset=4
                i32.eqz
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 3
                  i32.load offset=8
                  local.tee 4
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 2
                    br_if 0 (;@8;)
                    local.get 1
                    local.set 3
                    br 4 (;@4;)
                  end
                  i32.const 0
                  i32.load8_u offset=1053953
                  drop
                  br 2 (;@5;)
                end
                local.get 3
                i32.load
                local.get 4
                local.get 1
                local.get 2
                call $__rust_realloc
                local.set 3
                br 2 (;@4;)
              end
              block  ;; label = @6
                local.get 2
                br_if 0 (;@6;)
                local.get 1
                local.set 3
                br 2 (;@4;)
              end
              i32.const 0
              i32.load8_u offset=1053953
              drop
            end
            local.get 2
            local.get 1
            call $__rust_alloc
            local.set 3
          end
          block  ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.get 2
            i32.store offset=8
            local.get 0
            local.get 3
            i32.store offset=4
            local.get 0
            i32.const 0
            i32.store
            return
          end
          local.get 0
          local.get 2
          i32.store offset=8
          local.get 0
          local.get 1
          i32.store offset=4
          br 2 (;@1;)
        end
        local.get 0
        i32.const 0
        i32.store offset=4
        br 1 (;@1;)
      end
      local.get 0
      i32.const 0
      i32.store offset=4
    end
    local.get 0
    i32.const 1
    i32.store)
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17h322ca40853dbe2e1E (type 1) (param i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load
      local.tee 3
      i32.const 1
      i32.shl
      local.tee 4
      local.get 1
      local.get 4
      local.get 1
      i32.gt_u
      select
      local.tee 1
      i32.const 8
      local.get 1
      i32.const 8
      i32.gt_u
      select
      local.tee 1
      i32.const -1
      i32.xor
      i32.const 31
      i32.shr_u
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          i32.const 0
          local.set 3
          br 1 (;@2;)
        end
        local.get 2
        local.get 3
        i32.store offset=28
        local.get 2
        local.get 0
        i32.load offset=4
        i32.store offset=20
        i32.const 1
        local.set 3
      end
      local.get 2
      local.get 3
      i32.store offset=24
      local.get 2
      i32.const 8
      i32.add
      local.get 4
      local.get 1
      local.get 2
      i32.const 20
      i32.add
      call $_ZN5alloc7raw_vec11finish_grow17hb321f6aada7cc474E.llvm.8415571176415214293
      block  ;; label = @2
        local.get 2
        i32.load offset=8
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.load offset=12
        local.tee 0
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 2
        i32.load offset=16
        call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
        unreachable
      end
      local.get 2
      i32.load offset=12
      local.set 3
      local.get 0
      local.get 1
      i32.store
      local.get 0
      local.get 3
      i32.store offset=4
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    call $_ZN5alloc7raw_vec17capacity_overflow17h45f3b19af45ec27bE
    unreachable)
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17ha8d8870fa1fd559bE (type 6) (param i32 i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      local.get 2
      i32.add
      local.tee 2
      local.get 1
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 1
      local.set 4
      local.get 0
      i32.load
      local.tee 5
      i32.const 1
      i32.shl
      local.tee 1
      local.get 2
      local.get 1
      local.get 2
      i32.gt_u
      select
      local.tee 1
      i32.const 8
      local.get 1
      i32.const 8
      i32.gt_u
      select
      local.tee 1
      i32.const -1
      i32.xor
      i32.const 31
      i32.shr_u
      local.set 2
      block  ;; label = @2
        block  ;; label = @3
          local.get 5
          br_if 0 (;@3;)
          i32.const 0
          local.set 4
          br 1 (;@2;)
        end
        local.get 3
        local.get 5
        i32.store offset=28
        local.get 3
        local.get 0
        i32.load offset=4
        i32.store offset=20
      end
      local.get 3
      local.get 4
      i32.store offset=24
      local.get 3
      i32.const 8
      i32.add
      local.get 2
      local.get 1
      local.get 3
      i32.const 20
      i32.add
      call $_ZN5alloc7raw_vec11finish_grow17hb321f6aada7cc474E.llvm.8415571176415214293
      block  ;; label = @2
        local.get 3
        i32.load offset=8
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        i32.load offset=12
        local.tee 0
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 3
        i32.load offset=16
        call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
        unreachable
      end
      local.get 3
      i32.load offset=12
      local.set 2
      local.get 0
      local.get 1
      i32.store
      local.get 0
      local.get 2
      i32.store offset=4
      local.get 3
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    call $_ZN5alloc7raw_vec17capacity_overflow17h45f3b19af45ec27bE
    unreachable)
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h523f35a5a41ea52fE (type 1) (param i32 i32)
    local.get 0
    i64.const -4493808902380553279
    i64.store offset=8
    local.get 0
    i64.const -163230743173927068
    i64.store)
  (func $_ZN4core3ptr28drop_in_place$LT$$RF$str$GT$17h800211bd58f2cc07E.1 (type 0) (param i32))
  (func $_ZN4core3ptr77drop_in_place$LT$std..panicking..begin_panic_handler..FormatStringPayload$GT$17ha4b1fec6326a7cf9E (type 0) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.const -2147483648
      i32.eq
      br_if 0 (;@1;)
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end)
  (func $_ZN5alloc4sync16Arc$LT$T$C$A$GT$9drop_slow17h272dc83cd57b5547E (type 0) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 0
      i32.load offset=12
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=16
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end
    block  ;; label = @1
      local.get 0
      i32.const -1
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      i32.const 1
      i32.atomic.rmw.sub offset=4
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      atomic.fence
      local.get 0
      i32.const 24
      i32.const 4
      call $__rust_dealloc
    end)
  (func $_ZN3std6thread5sleep17he7bace389a782edbE (type 11) (param i64 i32)
    (local i32 i64 i64)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 8
    i32.add
    local.get 0
    i64.const 0
    i64.const 1000000000
    i64.const 0
    call $__multi3
    block  ;; label = @1
      local.get 2
      i64.load offset=8
      local.tee 3
      local.get 1
      i64.extend_i32_u
      i64.add
      local.tee 0
      local.get 2
      i32.const 16
      i32.add
      i64.load
      local.get 0
      local.get 3
      i64.lt_u
      i64.extend_i32_u
      i64.add
      local.tee 3
      i64.or
      i64.eqz
      br_if 0 (;@1;)
      loop  ;; label = @2
        local.get 2
        i32.const 0
        i32.store offset=28
        local.get 2
        i32.const 0
        local.get 0
        i64.const 9223372036854775807
        local.get 0
        i64.const 9223372036854775807
        i64.lt_u
        select
        i64.const 9223372036854775807
        local.get 3
        i64.eqz
        select
        local.tee 4
        memory.atomic.wait32 offset=28
        drop
        local.get 0
        local.get 4
        i64.lt_u
        local.set 1
        local.get 0
        local.get 4
        i64.sub
        local.tee 4
        local.set 0
        local.get 4
        local.get 3
        local.get 1
        i64.extend_i32_u
        i64.sub
        local.tee 3
        i64.or
        i64.const 0
        i64.ne
        br_if 0 (;@2;)
      end
    end
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN3std10sys_common9backtrace26__rust_end_short_backtrace17hefc9a3e6e4a3ff8aE (type 0) (param i32)
    local.get 0
    call $_ZN3std9panicking19begin_panic_handler28_$u7b$$u7b$closure$u7d$$u7d$17h8b3b504dfd65845cE
    unreachable)
  (func $_ZN3std9panicking19begin_panic_handler28_$u7b$$u7b$closure$u7d$$u7d$17h8b3b504dfd65845cE (type 0) (param i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.tee 2
    i32.load offset=12
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.load offset=4
            br_table 0 (;@4;) 1 (;@3;) 2 (;@2;)
          end
          local.get 3
          br_if 1 (;@2;)
          i32.const 1052576
          local.set 2
          i32.const 0
          local.set 3
          br 2 (;@1;)
        end
        local.get 3
        br_if 0 (;@2;)
        local.get 2
        i32.load
        local.tee 2
        i32.load offset=4
        local.set 3
        local.get 2
        i32.load
        local.set 2
        br 1 (;@1;)
      end
      local.get 1
      local.get 2
      i32.store offset=12
      local.get 1
      i32.const -2147483648
      i32.store
      local.get 1
      i32.const 1052612
      local.get 0
      i32.load offset=4
      local.tee 2
      i32.load offset=8
      local.get 0
      i32.load offset=8
      local.get 2
      i32.load8_u offset=16
      local.get 2
      i32.load8_u offset=17
      call $_ZN3std9panicking20rust_panic_with_hook17h5d938c6f2f6345baE
      unreachable
    end
    local.get 1
    local.get 3
    i32.store offset=4
    local.get 1
    local.get 2
    i32.store
    local.get 1
    i32.const 1052592
    local.get 0
    i32.load offset=4
    local.tee 2
    i32.load offset=8
    local.get 0
    i32.load offset=8
    local.get 2
    i32.load8_u offset=16
    local.get 2
    i32.load8_u offset=17
    call $_ZN3std9panicking20rust_panic_with_hook17h5d938c6f2f6345baE
    unreachable)
  (func $_ZN3std9panicking11panic_count17is_zero_slow_path17h69ec01d9f0b5341bE (type 4) (result i32)
    global.get $__tls_base
    i32.const 16
    i32.add
    i32.load
    i32.eqz)
  (func $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17h2d0fadd3ac8bb5afE (type 1) (param i32 i32)
    local.get 0
    i32.const 1052576
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store)
  (func $_ZN3std9panicking11panic_count17LOCAL_PANIC_COUNT7__getit17h1f4f26428983601aE.llvm.9857674224645661670 (type 10) (param i32) (result i32)
    global.get $__tls_base
    i32.const 16
    i32.add)
  (func $__rust_start_panic (type 2) (param i32 i32) (result i32)
    unreachable
    unreachable)
  (func $_ZN61_$LT$dlmalloc..sys..System$u20$as$u20$dlmalloc..Allocator$GT$5alloc17h293f24278785f002E (type 6) (param i32 i32 i32)
    (local i32)
    local.get 2
    i32.const 16
    i32.shr_u
    memory.grow
    local.set 3
    local.get 0
    i32.const 0
    i32.store offset=8
    local.get 0
    i32.const 0
    local.get 2
    i32.const -65536
    i32.and
    local.get 3
    i32.const -1
    i32.eq
    local.tee 2
    select
    i32.store offset=4
    local.get 0
    i32.const 0
    local.get 3
    i32.const 16
    i32.shl
    local.get 2
    select
    i32.store)
  (func $_ZN4core3ptr205drop_in_place$LT$$LT$alloc..boxed..Box$LT$dyn$u20$core..error..Error$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$u20$as$u20$core..convert..From$LT$alloc..string..String$GT$$GT$..from..StringError$GT$17h2008b045d902326fE (type 0) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end)
  (func $_ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17h3fa5012f7cea22daE (type 0) (param i32))
  (func $_ZN53_$LT$core..fmt..Error$u20$as$u20$core..fmt..Debug$GT$3fmt17haf1074f0f9151d42E.1 (type 2) (param i32 i32) (result i32)
    local.get 1
    i32.const 1052632
    i32.const 5
    call $_ZN4core3fmt9Formatter9write_str17h1fe892ce632ffc37E)
  (func $_ZN5alloc3fmt6format12format_inner17hdf9889be0525f8c9E (type 1) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 1
                i32.load offset=4
                local.tee 3
                i32.eqz
                br_if 0 (;@6;)
                local.get 1
                i32.load
                local.set 4
                local.get 3
                i32.const 3
                i32.and
                local.set 5
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 3
                    i32.const 4
                    i32.ge_u
                    br_if 0 (;@8;)
                    i32.const 0
                    local.set 3
                    i32.const 0
                    local.set 6
                    br 1 (;@7;)
                  end
                  local.get 4
                  i32.const 28
                  i32.add
                  local.set 7
                  local.get 3
                  i32.const -4
                  i32.and
                  local.set 8
                  i32.const 0
                  local.set 3
                  i32.const 0
                  local.set 6
                  loop  ;; label = @8
                    local.get 7
                    i32.load
                    local.get 7
                    i32.const -8
                    i32.add
                    i32.load
                    local.get 7
                    i32.const -16
                    i32.add
                    i32.load
                    local.get 7
                    i32.const -24
                    i32.add
                    i32.load
                    local.get 3
                    i32.add
                    i32.add
                    i32.add
                    i32.add
                    local.set 3
                    local.get 7
                    i32.const 32
                    i32.add
                    local.set 7
                    local.get 8
                    local.get 6
                    i32.const 4
                    i32.add
                    local.tee 6
                    i32.ne
                    br_if 0 (;@8;)
                  end
                end
                block  ;; label = @7
                  local.get 5
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 6
                  i32.const 3
                  i32.shl
                  local.get 4
                  i32.add
                  i32.const 4
                  i32.add
                  local.set 7
                  loop  ;; label = @8
                    local.get 7
                    i32.load
                    local.get 3
                    i32.add
                    local.set 3
                    local.get 7
                    i32.const 8
                    i32.add
                    local.set 7
                    local.get 5
                    i32.const -1
                    i32.add
                    local.tee 5
                    br_if 0 (;@8;)
                  end
                end
                block  ;; label = @7
                  local.get 1
                  i32.load offset=12
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 3
                  i32.const 0
                  i32.lt_s
                  br_if 1 (;@6;)
                  local.get 3
                  i32.const 16
                  i32.lt_u
                  local.get 4
                  i32.load offset=4
                  i32.eqz
                  i32.and
                  br_if 1 (;@6;)
                  local.get 3
                  i32.const 1
                  i32.shl
                  local.set 3
                end
                local.get 3
                br_if 1 (;@5;)
              end
              i32.const 1
              local.set 7
              i32.const 0
              local.set 3
              br 1 (;@4;)
            end
            local.get 3
            i32.const 0
            i32.lt_s
            br_if 1 (;@3;)
            i32.const 0
            i32.load8_u offset=1053953
            drop
            local.get 3
            i32.const 1
            call $__rust_alloc
            local.tee 7
            i32.eqz
            br_if 2 (;@2;)
          end
          local.get 2
          i32.const 0
          i32.store offset=8
          local.get 2
          local.get 7
          i32.store offset=4
          local.get 2
          local.get 3
          i32.store
          local.get 2
          i32.const 1052640
          local.get 1
          call $_ZN4core3fmt5write17h55b62ec8489b4effE
          i32.eqz
          br_if 2 (;@1;)
          i32.const 1052664
          i32.const 51
          local.get 2
          i32.const 15
          i32.add
          i32.const 1052716
          i32.const 1052852
          call $_ZN4core6result13unwrap_failed17ha1a4a677361ebda3E
          unreachable
        end
        call $_ZN5alloc7raw_vec17capacity_overflow17h45f3b19af45ec27bE
        unreachable
      end
      i32.const 1
      local.get 3
      call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
      unreachable
    end
    local.get 0
    local.get 2
    i64.load align=4
    i64.store align=4
    local.get 0
    i32.const 8
    i32.add
    local.get 2
    i32.const 8
    i32.add
    i32.load
    i32.store
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h52d87c11c795cdddE.4 (type 3) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.get 0
      i32.load offset=8
      local.tee 3
      i32.sub
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 2
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h5441694fa6a8dc4fE
      local.get 0
      i32.load offset=8
      local.set 3
    end
    local.get 0
    i32.load offset=4
    local.get 3
    i32.add
    local.get 1
    local.get 2
    memory.copy
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0)
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17had9e027a1aa3b2ccE.4 (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const 0
            i32.store offset=12
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            block  ;; label = @5
              local.get 1
              i32.const 65536
              i32.ge_u
              br_if 0 (;@5;)
              local.get 2
              local.get 1
              i32.const 12
              i32.shr_u
              i32.const 224
              i32.or
              i32.store8 offset=12
              local.get 2
              local.get 1
              i32.const 6
              i32.shr_u
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=13
              i32.const 3
              local.set 3
              i32.const 2
              local.set 4
              br 3 (;@2;)
            end
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            local.get 2
            local.get 1
            i32.const 18
            i32.shr_u
            i32.const 7
            i32.and
            i32.const 240
            i32.or
            i32.store8 offset=12
            i32.const 4
            local.set 3
            i32.const 3
            local.set 4
            br 2 (;@2;)
          end
          block  ;; label = @4
            local.get 0
            i32.load offset=8
            local.tee 3
            local.get 0
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 0
            local.get 3
            call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17hcafd0896ec389d28E
            local.get 0
            i32.load offset=8
            local.set 3
          end
          local.get 0
          i32.load offset=4
          local.get 3
          i32.add
          local.get 1
          i32.store8
          local.get 0
          local.get 0
          i32.load offset=8
          i32.const 1
          i32.add
          i32.store offset=8
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 3
        i32.const 1
        local.set 4
      end
      local.get 2
      i32.const 12
      i32.add
      local.get 4
      i32.or
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8
      block  ;; label = @2
        local.get 0
        i32.load
        local.get 0
        i32.load offset=8
        local.tee 1
        i32.sub
        local.get 3
        i32.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        local.get 3
        call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h5441694fa6a8dc4fE
        local.get 0
        i32.load offset=8
        local.set 1
      end
      local.get 0
      i32.load offset=4
      local.get 1
      i32.add
      local.get 2
      i32.const 12
      i32.add
      local.get 3
      memory.copy
      local.get 0
      local.get 1
      local.get 3
      i32.add
      i32.store offset=8
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    i32.const 0)
  (func $_ZN4core3fmt5Write9write_fmt17hed59aef0e547cad5E (type 2) (param i32 i32) (result i32)
    local.get 0
    i32.const 1052868
    local.get 1
    call $_ZN4core3fmt5write17h55b62ec8489b4effE)
  (func $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h347df457801b2e1fE (type 0) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end)
  (func $_ZN5alloc6string6String15from_utf8_lossy17h847cec55033f5fe5E (type 6) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 2
    i32.store offset=8
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    i32.const 32
    i32.add
    local.get 3
    i32.const 4
    i32.add
    call $_ZN87_$LT$core..str..lossy..Utf8Chunks$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hda991ca6d6612cbfE
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.load offset=32
          local.tee 4
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          i32.const 1052868
          local.set 4
          br 1 (;@2;)
        end
        local.get 3
        i32.load offset=36
        local.set 1
        local.get 3
        i32.load offset=44
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                br_if 0 (;@6;)
                i32.const 1
                local.set 5
                br 1 (;@5;)
              end
              local.get 2
              i32.const 0
              i32.lt_s
              br_if 1 (;@4;)
              i32.const 0
              i32.load8_u offset=1053953
              drop
              local.get 2
              i32.const 1
              call $__rust_alloc
              local.tee 5
              i32.eqz
              br_if 2 (;@3;)
            end
            i32.const 0
            local.set 6
            local.get 3
            i32.const 0
            i32.store offset=20
            local.get 3
            local.get 5
            i32.store offset=16
            local.get 3
            local.get 2
            i32.store offset=12
            block  ;; label = @5
              local.get 1
              local.get 2
              i32.le_u
              br_if 0 (;@5;)
              local.get 3
              i32.const 12
              i32.add
              i32.const 0
              local.get 1
              call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h5441694fa6a8dc4fE
              local.get 3
              i32.load offset=12
              local.set 2
              local.get 3
              i32.load offset=16
              local.set 5
              local.get 3
              i32.load offset=20
              local.set 6
            end
            local.get 5
            local.get 6
            i32.add
            local.get 4
            local.get 1
            memory.copy
            local.get 3
            local.get 6
            local.get 1
            i32.add
            local.tee 1
            i32.store offset=20
            block  ;; label = @5
              local.get 2
              local.get 1
              i32.sub
              i32.const 2
              i32.gt_u
              br_if 0 (;@5;)
              local.get 3
              i32.const 12
              i32.add
              local.get 1
              i32.const 3
              call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h5441694fa6a8dc4fE
              local.get 3
              i32.load offset=16
              local.set 5
              local.get 3
              i32.load offset=20
              local.set 1
            end
            local.get 5
            local.get 1
            i32.add
            local.tee 2
            i32.const 0
            i32.load16_u offset=1052892 align=1
            local.tee 7
            i32.store16 align=1
            local.get 2
            i32.const 2
            i32.add
            i32.const 0
            i32.load8_u offset=1052894
            local.tee 8
            i32.store8
            local.get 3
            local.get 1
            i32.const 3
            i32.add
            local.tee 2
            i32.store offset=20
            local.get 3
            local.get 3
            i64.load offset=4 align=4
            i64.store offset=24 align=4
            local.get 3
            i32.const 32
            i32.add
            local.get 3
            i32.const 24
            i32.add
            call $_ZN87_$LT$core..str..lossy..Utf8Chunks$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hda991ca6d6612cbfE
            block  ;; label = @5
              local.get 3
              i32.load offset=32
              local.tee 4
              i32.eqz
              br_if 0 (;@5;)
              loop  ;; label = @6
                local.get 3
                i32.load offset=44
                local.set 5
                block  ;; label = @7
                  local.get 3
                  i32.load offset=12
                  local.get 2
                  i32.sub
                  local.get 3
                  i32.load offset=36
                  local.tee 1
                  i32.ge_u
                  br_if 0 (;@7;)
                  local.get 3
                  i32.const 12
                  i32.add
                  local.get 2
                  local.get 1
                  call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h5441694fa6a8dc4fE
                  local.get 3
                  i32.load offset=20
                  local.set 2
                end
                local.get 3
                i32.load offset=16
                local.tee 6
                local.get 2
                i32.add
                local.get 4
                local.get 1
                memory.copy
                local.get 3
                local.get 2
                local.get 1
                i32.add
                local.tee 2
                i32.store offset=20
                block  ;; label = @7
                  local.get 5
                  i32.eqz
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 3
                    i32.load offset=12
                    local.get 2
                    i32.sub
                    i32.const 2
                    i32.gt_u
                    br_if 0 (;@8;)
                    local.get 3
                    i32.const 12
                    i32.add
                    local.get 2
                    i32.const 3
                    call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h5441694fa6a8dc4fE
                    local.get 3
                    i32.load offset=16
                    local.set 6
                    local.get 3
                    i32.load offset=20
                    local.set 2
                  end
                  local.get 6
                  local.get 2
                  i32.add
                  local.tee 1
                  local.get 7
                  i32.store16 align=1
                  local.get 1
                  i32.const 2
                  i32.add
                  local.get 8
                  i32.store8
                  local.get 3
                  local.get 2
                  i32.const 3
                  i32.add
                  local.tee 2
                  i32.store offset=20
                end
                local.get 3
                i32.const 32
                i32.add
                local.get 3
                i32.const 24
                i32.add
                call $_ZN87_$LT$core..str..lossy..Utf8Chunks$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hda991ca6d6612cbfE
                local.get 3
                i32.load offset=32
                local.tee 4
                br_if 0 (;@6;)
              end
            end
            local.get 0
            local.get 3
            i64.load offset=12 align=4
            i64.store align=4
            local.get 0
            i32.const 8
            i32.add
            local.get 3
            i32.const 12
            i32.add
            i32.const 8
            i32.add
            i32.load
            i32.store
            br 3 (;@1;)
          end
          call $_ZN5alloc7raw_vec17capacity_overflow17h45f3b19af45ec27bE
          unreachable
        end
        i32.const 1
        local.get 2
        call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
        unreachable
      end
      local.get 0
      local.get 1
      i32.store offset=8
      local.get 0
      local.get 4
      i32.store offset=4
      local.get 0
      i32.const -2147483648
      i32.store
    end
    local.get 3
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $_ZN60_$LT$alloc..string..String$u20$as$u20$core..clone..Clone$GT$5clone17h6b93b50df1762922E (type 1) (param i32 i32)
    (local i32 i32)
    local.get 1
    i32.load offset=4
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load offset=8
            local.tee 1
            br_if 0 (;@4;)
            i32.const 1
            local.set 3
            br 1 (;@3;)
          end
          local.get 1
          i32.const 0
          i32.lt_s
          br_if 1 (;@2;)
          i32.const 0
          i32.load8_u offset=1053953
          drop
          local.get 1
          i32.const 1
          call $__rust_alloc
          local.tee 3
          i32.eqz
          br_if 2 (;@1;)
        end
        local.get 3
        local.get 2
        local.get 1
        memory.copy
        local.get 0
        local.get 1
        i32.store offset=8
        local.get 0
        local.get 3
        i32.store offset=4
        local.get 0
        local.get 1
        i32.store
        return
      end
      call $_ZN5alloc7raw_vec17capacity_overflow17h45f3b19af45ec27bE
      unreachable
    end
    i32.const 1
    local.get 1
    call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
    unreachable)
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h52d87c11c795cdddE.5 (type 3) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.get 0
      i32.load offset=8
      local.tee 3
      i32.sub
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 2
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h5441694fa6a8dc4fE
      local.get 0
      i32.load offset=8
      local.set 3
    end
    local.get 0
    i32.load offset=4
    local.get 3
    i32.add
    local.get 1
    local.get 2
    memory.copy
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0)
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17had9e027a1aa3b2ccE.5 (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const 0
            i32.store offset=12
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            block  ;; label = @5
              local.get 1
              i32.const 65536
              i32.ge_u
              br_if 0 (;@5;)
              local.get 2
              local.get 1
              i32.const 12
              i32.shr_u
              i32.const 224
              i32.or
              i32.store8 offset=12
              local.get 2
              local.get 1
              i32.const 6
              i32.shr_u
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=13
              i32.const 3
              local.set 3
              i32.const 2
              local.set 4
              br 3 (;@2;)
            end
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            local.get 2
            local.get 1
            i32.const 18
            i32.shr_u
            i32.const 7
            i32.and
            i32.const 240
            i32.or
            i32.store8 offset=12
            i32.const 4
            local.set 3
            i32.const 3
            local.set 4
            br 2 (;@2;)
          end
          block  ;; label = @4
            local.get 0
            i32.load offset=8
            local.tee 3
            local.get 0
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 0
            local.get 3
            call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17hcafd0896ec389d28E
            local.get 0
            i32.load offset=8
            local.set 3
          end
          local.get 0
          i32.load offset=4
          local.get 3
          i32.add
          local.get 1
          i32.store8
          local.get 0
          local.get 0
          i32.load offset=8
          i32.const 1
          i32.add
          i32.store offset=8
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 3
        i32.const 1
        local.set 4
      end
      local.get 2
      i32.const 12
      i32.add
      local.get 4
      i32.or
      local.get 1
      i32.const 63
      i32.and
      i32.const 128
      i32.or
      i32.store8
      block  ;; label = @2
        local.get 0
        i32.load
        local.get 0
        i32.load offset=8
        local.tee 1
        i32.sub
        local.get 3
        i32.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        local.get 3
        call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h5441694fa6a8dc4fE
        local.get 0
        i32.load offset=8
        local.set 1
      end
      local.get 0
      i32.load offset=4
      local.get 1
      i32.add
      local.get 2
      i32.const 12
      i32.add
      local.get 3
      memory.copy
      local.get 0
      local.get 1
      local.get 3
      i32.add
      i32.store offset=8
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    i32.const 0)
  (func $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E (type 1) (param i32 i32)
    local.get 1
    local.get 0
    call $__rust_alloc_error_handler
    unreachable)
  (func $_ZN5alloc7raw_vec17capacity_overflow17h45f3b19af45ec27bE (type 5)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    local.get 0
    i32.const 1
    i32.store offset=12
    local.get 0
    i32.const 1052916
    i32.store offset=8
    local.get 0
    i64.const 0
    i64.store offset=20 align=4
    local.get 0
    i32.const 1052896
    i32.store offset=16
    local.get 0
    i32.const 8
    i32.add
    i32.const 1053048
    call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
    unreachable)
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h5441694fa6a8dc4fE (type 6) (param i32 i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      local.get 2
      i32.add
      local.tee 2
      local.get 1
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 1
      local.set 4
      local.get 0
      i32.load
      local.tee 5
      i32.const 1
      i32.shl
      local.tee 1
      local.get 2
      local.get 1
      local.get 2
      i32.gt_u
      select
      local.tee 1
      i32.const 8
      local.get 1
      i32.const 8
      i32.gt_u
      select
      local.tee 1
      i32.const -1
      i32.xor
      i32.const 31
      i32.shr_u
      local.set 2
      block  ;; label = @2
        block  ;; label = @3
          local.get 5
          br_if 0 (;@3;)
          i32.const 0
          local.set 4
          br 1 (;@2;)
        end
        local.get 3
        local.get 5
        i32.store offset=28
        local.get 3
        local.get 0
        i32.load offset=4
        i32.store offset=20
      end
      local.get 3
      local.get 4
      i32.store offset=24
      local.get 3
      i32.const 8
      i32.add
      local.get 2
      local.get 1
      local.get 3
      i32.const 20
      i32.add
      call $_ZN5alloc7raw_vec11finish_grow17h75a37a1d50972659E.llvm.15781162937458493533
      block  ;; label = @2
        local.get 3
        i32.load offset=8
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        i32.load offset=12
        local.tee 0
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 3
        i32.load offset=16
        call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
        unreachable
      end
      local.get 3
      i32.load offset=12
      local.set 2
      local.get 0
      local.get 1
      i32.store
      local.get 0
      local.get 2
      i32.store offset=4
      local.get 3
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    call $_ZN5alloc7raw_vec17capacity_overflow17h45f3b19af45ec27bE
    unreachable)
  (func $_ZN5alloc7raw_vec11finish_grow17h75a37a1d50972659E.llvm.15781162937458493533 (type 7) (param i32 i32 i32 i32)
    (local i32 i32 i32)
    i32.const 1
    local.set 4
    i32.const 0
    local.set 5
    i32.const 4
    local.set 6
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.load offset=4
                i32.eqz
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 3
                  i32.load offset=8
                  local.tee 4
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 2
                    br_if 0 (;@8;)
                    i32.const 1
                    local.set 4
                    br 4 (;@4;)
                  end
                  i32.const 0
                  i32.load8_u offset=1053953
                  drop
                  local.get 2
                  i32.const 1
                  call $__rust_alloc
                  local.set 4
                  br 2 (;@5;)
                end
                local.get 3
                i32.load
                local.get 4
                i32.const 1
                local.get 2
                call $__rust_realloc
                local.set 4
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 2
                br_if 0 (;@6;)
                i32.const 1
                local.set 4
                br 2 (;@4;)
              end
              i32.const 0
              i32.load8_u offset=1053953
              drop
              local.get 2
              i32.const 1
              call $__rust_alloc
              local.set 4
            end
            local.get 4
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 0
          local.get 4
          i32.store offset=4
          i32.const 0
          local.set 4
          br 1 (;@2;)
        end
        i32.const 1
        local.set 4
        local.get 0
        i32.const 1
        i32.store offset=4
      end
      i32.const 8
      local.set 6
      local.get 2
      local.set 5
    end
    local.get 0
    local.get 6
    i32.add
    local.get 5
    i32.store
    local.get 0
    local.get 4
    i32.store)
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$16reserve_for_push17hcafd0896ec389d28E (type 1) (param i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      i32.const 1
      i32.add
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load
      local.tee 3
      i32.const 1
      i32.shl
      local.tee 4
      local.get 1
      local.get 4
      local.get 1
      i32.gt_u
      select
      local.tee 1
      i32.const 8
      local.get 1
      i32.const 8
      i32.gt_u
      select
      local.tee 1
      i32.const -1
      i32.xor
      i32.const 31
      i32.shr_u
      local.set 4
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          i32.const 0
          local.set 3
          br 1 (;@2;)
        end
        local.get 2
        local.get 3
        i32.store offset=28
        local.get 2
        local.get 0
        i32.load offset=4
        i32.store offset=20
        i32.const 1
        local.set 3
      end
      local.get 2
      local.get 3
      i32.store offset=24
      local.get 2
      i32.const 8
      i32.add
      local.get 4
      local.get 1
      local.get 2
      i32.const 20
      i32.add
      call $_ZN5alloc7raw_vec11finish_grow17h75a37a1d50972659E.llvm.15781162937458493533
      block  ;; label = @2
        local.get 2
        i32.load offset=8
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.load offset=12
        local.tee 0
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        local.get 2
        i32.load offset=16
        call $_ZN5alloc5alloc18handle_alloc_error17h6a974b9d266a95a8E
        unreachable
      end
      local.get 2
      i32.load offset=12
      local.set 3
      local.get 0
      local.get 1
      i32.store
      local.get 0
      local.get 3
      i32.store offset=4
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    call $_ZN5alloc7raw_vec17capacity_overflow17h45f3b19af45ec27bE
    unreachable)
  (func $_ZN4core3fmt5write17h55b62ec8489b4effE (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 3
    i32.store8 offset=44
    local.get 3
    i32.const 32
    i32.store offset=28
    i32.const 0
    local.set 4
    local.get 3
    i32.const 0
    i32.store offset=40
    local.get 3
    local.get 1
    i32.store offset=36
    local.get 3
    local.get 0
    i32.store offset=32
    local.get 3
    i32.const 0
    i32.store offset=20
    local.get 3
    i32.const 0
    i32.store offset=12
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.load offset=16
              local.tee 5
              br_if 0 (;@5;)
              local.get 2
              i32.load offset=12
              local.tee 0
              i32.eqz
              br_if 1 (;@4;)
              local.get 2
              i32.load offset=8
              local.set 1
              local.get 0
              i32.const 3
              i32.shl
              local.set 6
              local.get 0
              i32.const -1
              i32.add
              i32.const 536870911
              i32.and
              i32.const 1
              i32.add
              local.set 4
              local.get 2
              i32.load
              local.set 0
              loop  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  i32.const 4
                  i32.add
                  i32.load
                  local.tee 7
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 3
                  i32.load offset=32
                  local.get 0
                  i32.load
                  local.get 7
                  local.get 3
                  i32.load offset=36
                  i32.load offset=12
                  call_indirect (type 3)
                  br_if 4 (;@3;)
                end
                local.get 1
                i32.load
                local.get 3
                i32.const 12
                i32.add
                local.get 1
                i32.load offset=4
                call_indirect (type 2)
                br_if 3 (;@3;)
                local.get 1
                i32.const 8
                i32.add
                local.set 1
                local.get 0
                i32.const 8
                i32.add
                local.set 0
                local.get 6
                i32.const -8
                i32.add
                local.tee 6
                br_if 0 (;@6;)
                br 2 (;@4;)
              end
            end
            local.get 2
            i32.load offset=20
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.const 5
            i32.shl
            local.set 8
            local.get 1
            i32.const -1
            i32.add
            i32.const 134217727
            i32.and
            i32.const 1
            i32.add
            local.set 4
            local.get 2
            i32.load offset=8
            local.set 9
            local.get 2
            i32.load
            local.set 0
            i32.const 0
            local.set 6
            loop  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.const 4
                i32.add
                i32.load
                local.tee 1
                i32.eqz
                br_if 0 (;@6;)
                local.get 3
                i32.load offset=32
                local.get 0
                i32.load
                local.get 1
                local.get 3
                i32.load offset=36
                i32.load offset=12
                call_indirect (type 3)
                br_if 3 (;@3;)
              end
              local.get 3
              local.get 5
              local.get 6
              i32.add
              local.tee 1
              i32.const 16
              i32.add
              i32.load
              i32.store offset=28
              local.get 3
              local.get 1
              i32.const 28
              i32.add
              i32.load8_u
              i32.store8 offset=44
              local.get 3
              local.get 1
              i32.const 24
              i32.add
              i32.load
              i32.store offset=40
              local.get 1
              i32.const 12
              i32.add
              i32.load
              local.set 7
              i32.const 0
              local.set 10
              i32.const 0
              local.set 11
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 1
                    i32.const 8
                    i32.add
                    i32.load
                    br_table 1 (;@7;) 0 (;@8;) 2 (;@6;) 1 (;@7;)
                  end
                  local.get 7
                  i32.const 3
                  i32.shl
                  local.set 12
                  i32.const 0
                  local.set 11
                  local.get 9
                  local.get 12
                  i32.add
                  local.tee 12
                  i32.load offset=4
                  i32.const 57
                  i32.ne
                  br_if 1 (;@6;)
                  local.get 12
                  i32.load
                  i32.load
                  local.set 7
                end
                i32.const 1
                local.set 11
              end
              local.get 3
              local.get 7
              i32.store offset=16
              local.get 3
              local.get 11
              i32.store offset=12
              local.get 1
              i32.const 4
              i32.add
              i32.load
              local.set 7
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 1
                    i32.load
                    br_table 1 (;@7;) 0 (;@8;) 2 (;@6;) 1 (;@7;)
                  end
                  local.get 7
                  i32.const 3
                  i32.shl
                  local.set 11
                  local.get 9
                  local.get 11
                  i32.add
                  local.tee 11
                  i32.load offset=4
                  i32.const 57
                  i32.ne
                  br_if 1 (;@6;)
                  local.get 11
                  i32.load
                  i32.load
                  local.set 7
                end
                i32.const 1
                local.set 10
              end
              local.get 3
              local.get 7
              i32.store offset=24
              local.get 3
              local.get 10
              i32.store offset=20
              local.get 9
              local.get 1
              i32.const 20
              i32.add
              i32.load
              i32.const 3
              i32.shl
              i32.add
              local.tee 1
              i32.load
              local.get 3
              i32.const 12
              i32.add
              local.get 1
              i32.load offset=4
              call_indirect (type 2)
              br_if 2 (;@3;)
              local.get 0
              i32.const 8
              i32.add
              local.set 0
              local.get 8
              local.get 6
              i32.const 32
              i32.add
              local.tee 6
              i32.ne
              br_if 0 (;@5;)
            end
          end
          local.get 4
          local.get 2
          i32.load offset=4
          i32.ge_u
          br_if 1 (;@2;)
          local.get 3
          i32.load offset=32
          local.get 2
          i32.load
          local.get 4
          i32.const 3
          i32.shl
          i32.add
          local.tee 1
          i32.load
          local.get 1
          i32.load offset=4
          local.get 3
          i32.load offset=36
          i32.load offset=12
          call_indirect (type 3)
          i32.eqz
          br_if 1 (;@2;)
        end
        i32.const 1
        local.set 1
        br 1 (;@1;)
      end
      i32.const 0
      local.set 1
    end
    local.get 3
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $_ZN4core3fmt9Formatter12pad_integral17h0f3b9f3b71d03c2bE (type 12) (param i32 i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        local.get 5
        i32.const 1
        i32.add
        local.set 6
        local.get 0
        i32.load offset=28
        local.set 7
        i32.const 45
        local.set 8
        br 1 (;@1;)
      end
      i32.const 43
      i32.const 1114112
      local.get 0
      i32.load offset=28
      local.tee 7
      i32.const 1
      i32.and
      local.tee 1
      select
      local.set 8
      local.get 1
      local.get 5
      i32.add
      local.set 6
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 7
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        br 1 (;@1;)
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          call $_ZN4core3str5count14do_count_chars17hc7dd2f4211067435E
          local.set 1
          br 1 (;@2;)
        end
        block  ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          br 1 (;@2;)
        end
        local.get 3
        i32.const 3
        i32.and
        local.set 9
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.const 4
            i32.ge_u
            br_if 0 (;@4;)
            i32.const 0
            local.set 1
            i32.const 0
            local.set 10
            br 1 (;@3;)
          end
          local.get 3
          i32.const 12
          i32.and
          local.set 11
          i32.const 0
          local.set 1
          i32.const 0
          local.set 10
          loop  ;; label = @4
            local.get 1
            local.get 2
            local.get 10
            i32.add
            local.tee 12
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 12
            i32.const 1
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 12
            i32.const 2
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 12
            i32.const 3
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 1
            local.get 11
            local.get 10
            i32.const 4
            i32.add
            local.tee 10
            i32.ne
            br_if 0 (;@4;)
          end
        end
        local.get 9
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 10
        i32.add
        local.set 12
        loop  ;; label = @3
          local.get 1
          local.get 12
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.set 1
          local.get 12
          i32.const 1
          i32.add
          local.set 12
          local.get 9
          i32.const -1
          i32.add
          local.tee 9
          br_if 0 (;@3;)
        end
      end
      local.get 1
      local.get 6
      i32.add
      local.set 6
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load
        br_if 0 (;@2;)
        i32.const 1
        local.set 1
        local.get 0
        i32.load offset=20
        local.tee 12
        local.get 0
        i32.load offset=24
        local.tee 10
        local.get 8
        local.get 2
        local.get 3
        call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h3b609045010e26aeE
        br_if 1 (;@1;)
        local.get 12
        local.get 4
        local.get 5
        local.get 10
        i32.load offset=12
        call_indirect (type 3)
        return
      end
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 9
        local.get 6
        i32.gt_u
        br_if 0 (;@2;)
        i32.const 1
        local.set 1
        local.get 0
        i32.load offset=20
        local.tee 12
        local.get 0
        i32.load offset=24
        local.tee 10
        local.get 8
        local.get 2
        local.get 3
        call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h3b609045010e26aeE
        br_if 1 (;@1;)
        local.get 12
        local.get 4
        local.get 5
        local.get 10
        i32.load offset=12
        call_indirect (type 3)
        return
      end
      block  ;; label = @2
        local.get 7
        i32.const 8
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=16
        local.set 11
        local.get 0
        i32.const 48
        i32.store offset=16
        local.get 0
        i32.load8_u offset=32
        local.set 7
        i32.const 1
        local.set 1
        local.get 0
        i32.const 1
        i32.store8 offset=32
        local.get 0
        i32.load offset=20
        local.tee 12
        local.get 0
        i32.load offset=24
        local.tee 10
        local.get 8
        local.get 2
        local.get 3
        call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h3b609045010e26aeE
        br_if 1 (;@1;)
        local.get 9
        local.get 6
        i32.sub
        i32.const 1
        i32.add
        local.set 1
        block  ;; label = @3
          loop  ;; label = @4
            local.get 1
            i32.const -1
            i32.add
            local.tee 1
            i32.eqz
            br_if 1 (;@3;)
            local.get 12
            i32.const 48
            local.get 10
            i32.load offset=16
            call_indirect (type 2)
            i32.eqz
            br_if 0 (;@4;)
          end
          i32.const 1
          return
        end
        i32.const 1
        local.set 1
        local.get 12
        local.get 4
        local.get 5
        local.get 10
        i32.load offset=12
        call_indirect (type 3)
        br_if 1 (;@1;)
        local.get 0
        local.get 7
        i32.store8 offset=32
        local.get 0
        local.get 11
        i32.store offset=16
        i32.const 0
        local.set 1
        br 1 (;@1;)
      end
      local.get 9
      local.get 6
      i32.sub
      local.set 6
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load8_u offset=32
            local.tee 1
            br_table 2 (;@2;) 0 (;@4;) 1 (;@3;) 0 (;@4;) 2 (;@2;)
          end
          local.get 6
          local.set 1
          i32.const 0
          local.set 6
          br 1 (;@2;)
        end
        local.get 6
        i32.const 1
        i32.shr_u
        local.set 1
        local.get 6
        i32.const 1
        i32.add
        i32.const 1
        i32.shr_u
        local.set 6
      end
      local.get 1
      i32.const 1
      i32.add
      local.set 1
      local.get 0
      i32.load offset=16
      local.set 9
      local.get 0
      i32.load offset=24
      local.set 12
      local.get 0
      i32.load offset=20
      local.set 10
      block  ;; label = @2
        loop  ;; label = @3
          local.get 1
          i32.const -1
          i32.add
          local.tee 1
          i32.eqz
          br_if 1 (;@2;)
          local.get 10
          local.get 9
          local.get 12
          i32.load offset=16
          call_indirect (type 2)
          i32.eqz
          br_if 0 (;@3;)
        end
        i32.const 1
        return
      end
      i32.const 1
      local.set 1
      local.get 10
      local.get 12
      local.get 8
      local.get 2
      local.get 3
      call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h3b609045010e26aeE
      br_if 0 (;@1;)
      local.get 10
      local.get 4
      local.get 5
      local.get 12
      i32.load offset=12
      call_indirect (type 3)
      br_if 0 (;@1;)
      i32.const 0
      local.set 1
      loop  ;; label = @2
        block  ;; label = @3
          local.get 6
          local.get 1
          i32.ne
          br_if 0 (;@3;)
          local.get 6
          local.get 6
          i32.lt_u
          return
        end
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 10
        local.get 9
        local.get 12
        i32.load offset=16
        call_indirect (type 2)
        i32.eqz
        br_if 0 (;@2;)
      end
      local.get 1
      i32.const -1
      i32.add
      local.get 6
      i32.lt_u
      return
    end
    local.get 1)
  (func $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h3b609045010e26aeE (type 13) (param i32 i32 i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 1114112
          i32.eq
          br_if 0 (;@3;)
          i32.const 1
          local.set 5
          local.get 0
          local.get 2
          local.get 1
          i32.load offset=16
          call_indirect (type 2)
          br_if 1 (;@2;)
        end
        local.get 3
        br_if 1 (;@1;)
        i32.const 0
        local.set 5
      end
      local.get 5
      return
    end
    local.get 0
    local.get 3
    local.get 4
    local.get 1
    i32.load offset=12
    call_indirect (type 3))
  (func $_ZN4core3fmt9Formatter3pad17h93200912c8de0739E (type 3) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 3
      local.get 0
      i32.load offset=8
      local.tee 4
      i32.or
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 2
        i32.add
        local.set 5
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load offset=12
            local.tee 6
            br_if 0 (;@4;)
            i32.const 0
            local.set 7
            local.get 1
            local.set 8
            br 1 (;@3;)
          end
          i32.const 0
          local.set 7
          local.get 1
          local.set 8
          loop  ;; label = @4
            local.get 8
            local.tee 4
            local.get 5
            i32.eq
            br_if 2 (;@2;)
            block  ;; label = @5
              block  ;; label = @6
                local.get 4
                i32.load8_s
                local.tee 8
                i32.const -1
                i32.le_s
                br_if 0 (;@6;)
                local.get 4
                i32.const 1
                i32.add
                local.set 8
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 8
                i32.const -32
                i32.ge_u
                br_if 0 (;@6;)
                local.get 4
                i32.const 2
                i32.add
                local.set 8
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 8
                i32.const -16
                i32.ge_u
                br_if 0 (;@6;)
                local.get 4
                i32.const 3
                i32.add
                local.set 8
                br 1 (;@5;)
              end
              local.get 4
              i32.load8_u offset=2
              i32.const 63
              i32.and
              i32.const 6
              i32.shl
              local.get 4
              i32.load8_u offset=1
              i32.const 63
              i32.and
              i32.const 12
              i32.shl
              i32.or
              local.get 4
              i32.load8_u offset=3
              i32.const 63
              i32.and
              i32.or
              local.get 8
              i32.const 255
              i32.and
              i32.const 18
              i32.shl
              i32.const 1835008
              i32.and
              i32.or
              i32.const 1114112
              i32.eq
              br_if 3 (;@2;)
              local.get 4
              i32.const 4
              i32.add
              local.set 8
            end
            local.get 7
            local.get 4
            i32.sub
            local.get 8
            i32.add
            local.set 7
            local.get 6
            i32.const -1
            i32.add
            local.tee 6
            br_if 0 (;@4;)
          end
        end
        local.get 8
        local.get 5
        i32.eq
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 8
          i32.load8_s
          local.tee 4
          i32.const -1
          i32.gt_s
          br_if 0 (;@3;)
          local.get 4
          i32.const -32
          i32.lt_u
          br_if 0 (;@3;)
          local.get 4
          i32.const -16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 8
          i32.load8_u offset=2
          i32.const 63
          i32.and
          i32.const 6
          i32.shl
          local.get 8
          i32.load8_u offset=1
          i32.const 63
          i32.and
          i32.const 12
          i32.shl
          i32.or
          local.get 8
          i32.load8_u offset=3
          i32.const 63
          i32.and
          i32.or
          local.get 4
          i32.const 255
          i32.and
          i32.const 18
          i32.shl
          i32.const 1835008
          i32.and
          i32.or
          i32.const 1114112
          i32.eq
          br_if 1 (;@2;)
        end
        block  ;; label = @3
          local.get 7
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 7
            local.get 2
            i32.lt_u
            br_if 0 (;@4;)
            local.get 7
            local.get 2
            i32.eq
            br_if 1 (;@3;)
            br 2 (;@2;)
          end
          local.get 1
          local.get 7
          i32.add
          i32.load8_s
          i32.const -64
          i32.lt_s
          br_if 1 (;@2;)
        end
        local.get 7
        local.set 2
      end
      block  ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=20
        local.get 1
        local.get 2
        local.get 0
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 3)
        return
      end
      local.get 0
      i32.load offset=4
      local.set 3
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 1
          local.get 2
          call $_ZN4core3str5count14do_count_chars17hc7dd2f4211067435E
          local.set 4
          br 1 (;@2;)
        end
        block  ;; label = @3
          local.get 2
          br_if 0 (;@3;)
          i32.const 0
          local.set 4
          br 1 (;@2;)
        end
        local.get 2
        i32.const 3
        i32.and
        local.set 6
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.const 4
            i32.ge_u
            br_if 0 (;@4;)
            i32.const 0
            local.set 4
            i32.const 0
            local.set 7
            br 1 (;@3;)
          end
          local.get 2
          i32.const 12
          i32.and
          local.set 5
          i32.const 0
          local.set 4
          i32.const 0
          local.set 7
          loop  ;; label = @4
            local.get 4
            local.get 1
            local.get 7
            i32.add
            local.tee 8
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 8
            i32.const 1
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 8
            i32.const 2
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 8
            i32.const 3
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 4
            local.get 5
            local.get 7
            i32.const 4
            i32.add
            local.tee 7
            i32.ne
            br_if 0 (;@4;)
          end
        end
        local.get 6
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 7
        i32.add
        local.set 8
        loop  ;; label = @3
          local.get 4
          local.get 8
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.set 4
          local.get 8
          i32.const 1
          i32.add
          local.set 8
          local.get 6
          i32.const -1
          i32.add
          local.tee 6
          br_if 0 (;@3;)
        end
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          local.get 4
          i32.le_u
          br_if 0 (;@3;)
          local.get 3
          local.get 4
          i32.sub
          local.set 5
          i32.const 0
          local.set 4
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load8_u offset=32
                br_table 2 (;@4;) 0 (;@6;) 1 (;@5;) 2 (;@4;) 2 (;@4;)
              end
              local.get 5
              local.set 4
              i32.const 0
              local.set 5
              br 1 (;@4;)
            end
            local.get 5
            i32.const 1
            i32.shr_u
            local.set 4
            local.get 5
            i32.const 1
            i32.add
            i32.const 1
            i32.shr_u
            local.set 5
          end
          local.get 4
          i32.const 1
          i32.add
          local.set 4
          local.get 0
          i32.load offset=16
          local.set 6
          local.get 0
          i32.load offset=24
          local.set 8
          local.get 0
          i32.load offset=20
          local.set 7
          loop  ;; label = @4
            local.get 4
            i32.const -1
            i32.add
            local.tee 4
            i32.eqz
            br_if 2 (;@2;)
            local.get 7
            local.get 6
            local.get 8
            i32.load offset=16
            call_indirect (type 2)
            i32.eqz
            br_if 0 (;@4;)
          end
          i32.const 1
          return
        end
        local.get 0
        i32.load offset=20
        local.get 1
        local.get 2
        local.get 0
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 3)
        return
      end
      i32.const 1
      local.set 4
      block  ;; label = @2
        local.get 7
        local.get 1
        local.get 2
        local.get 8
        i32.load offset=12
        call_indirect (type 3)
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        block  ;; label = @3
          loop  ;; label = @4
            block  ;; label = @5
              local.get 5
              local.get 4
              i32.ne
              br_if 0 (;@5;)
              local.get 5
              local.set 4
              br 2 (;@3;)
            end
            local.get 4
            i32.const 1
            i32.add
            local.set 4
            local.get 7
            local.get 6
            local.get 8
            i32.load offset=16
            call_indirect (type 2)
            i32.eqz
            br_if 0 (;@4;)
          end
          local.get 4
          i32.const -1
          i32.add
          local.set 4
        end
        local.get 4
        local.get 5
        i32.lt_u
        local.set 4
      end
      local.get 4
      return
    end
    local.get 0
    i32.load offset=20
    local.get 1
    local.get 2
    local.get 0
    i32.load offset=24
    i32.load offset=12
    call_indirect (type 3))
  (func $_ZN4core3fmt9Formatter9write_str17h1fe892ce632ffc37E (type 3) (param i32 i32 i32) (result i32)
    local.get 0
    i32.load offset=20
    local.get 1
    local.get 2
    local.get 0
    i32.load offset=24
    i32.load offset=12
    call_indirect (type 3))
  (func $_ZN42_$LT$str$u20$as$u20$core..fmt..Display$GT$3fmt17h88408237604245e2E (type 3) (param i32 i32 i32) (result i32)
    local.get 2
    local.get 0
    local.get 1
    call $_ZN4core3fmt9Formatter3pad17h93200912c8de0739E)
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h7444cfe9f847f71eE (type 2) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    local.get 0
    i32.load offset=4
    i32.load offset=12
    call_indirect (type 2))
  (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h3311e449c4f06445E (type 2) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    call $_ZN4core3fmt9Formatter3pad17h93200912c8de0739E)
  (func $_ZN4core3ptr88drop_in_place$LT$core..panic..panic_info..PanicInfo..internal_constructor..NoPayload$GT$17hbcc9e157a10fdfcaE (type 0) (param i32))
  (func $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE (type 1) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 1
    i32.store16 offset=28
    local.get 2
    local.get 1
    i32.store offset=24
    local.get 2
    local.get 0
    i32.store offset=20
    local.get 2
    i32.const 1053264
    i32.store offset=16
    local.get 2
    i32.const 1053264
    i32.store offset=12
    local.get 2
    i32.const 12
    i32.add
    call $rust_begin_unwind
    unreachable)
  (func $_ZN4core9panicking5panic17h5183d2125e960738E (type 6) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 1
    i32.store offset=4
    local.get 3
    i64.const 0
    i64.store offset=12 align=4
    local.get 3
    i32.const 1053264
    i32.store offset=8
    local.get 3
    local.get 1
    i32.store offset=28
    local.get 3
    local.get 0
    i32.store offset=24
    local.get 3
    local.get 3
    i32.const 24
    i32.add
    i32.store
    local.get 3
    local.get 2
    call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
    unreachable)
  (func $_ZN4core5slice6memchr7memrchr17h0f954a0b5e3b458fE (type 7) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    local.get 3
    i32.const 0
    local.get 3
    local.get 2
    i32.const 3
    i32.add
    i32.const -4
    i32.and
    local.get 2
    i32.sub
    local.tee 4
    i32.sub
    i32.const 7
    i32.and
    local.get 3
    local.get 4
    i32.lt_u
    select
    local.tee 5
    i32.sub
    local.set 6
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            local.get 5
            i32.lt_u
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 5
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              local.get 3
              i32.add
              local.tee 5
              local.get 2
              local.get 6
              i32.add
              local.tee 7
              i32.sub
              local.set 8
              block  ;; label = @6
                block  ;; label = @7
                  local.get 5
                  i32.const -1
                  i32.add
                  local.tee 9
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -1
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 9
                i32.eq
                br_if 1 (;@5;)
                block  ;; label = @7
                  local.get 5
                  i32.const -2
                  i32.add
                  local.tee 9
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -2
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 9
                i32.eq
                br_if 1 (;@5;)
                block  ;; label = @7
                  local.get 5
                  i32.const -3
                  i32.add
                  local.tee 9
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -3
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 9
                i32.eq
                br_if 1 (;@5;)
                block  ;; label = @7
                  local.get 5
                  i32.const -4
                  i32.add
                  local.tee 9
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -4
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 9
                i32.eq
                br_if 1 (;@5;)
                block  ;; label = @7
                  local.get 5
                  i32.const -5
                  i32.add
                  local.tee 9
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -5
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 9
                i32.eq
                br_if 1 (;@5;)
                block  ;; label = @7
                  local.get 5
                  i32.const -6
                  i32.add
                  local.tee 9
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -6
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 9
                i32.eq
                br_if 1 (;@5;)
                block  ;; label = @7
                  local.get 5
                  i32.const -7
                  i32.add
                  local.tee 5
                  i32.load8_u
                  local.get 1
                  i32.const 255
                  i32.and
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 8
                  i32.const -7
                  i32.add
                  local.set 4
                  br 1 (;@6;)
                end
                local.get 7
                local.get 5
                i32.eq
                br_if 1 (;@5;)
                local.get 8
                i32.const -8
                i32.add
                local.set 4
              end
              local.get 4
              local.get 6
              i32.add
              local.set 4
              br 3 (;@2;)
            end
            local.get 4
            local.get 3
            local.get 3
            local.get 4
            i32.gt_u
            select
            local.set 9
            local.get 1
            i32.const 255
            i32.and
            i32.const 16843009
            i32.mul
            local.set 5
            block  ;; label = @5
              loop  ;; label = @6
                local.get 6
                local.tee 4
                local.get 9
                i32.le_u
                br_if 1 (;@5;)
                local.get 4
                i32.const -8
                i32.add
                local.set 6
                local.get 2
                local.get 4
                i32.add
                local.tee 8
                i32.const -4
                i32.add
                i32.load
                local.get 5
                i32.xor
                local.tee 7
                i32.const -16843009
                i32.add
                local.get 7
                i32.const -1
                i32.xor
                i32.and
                local.get 8
                i32.const -8
                i32.add
                i32.load
                local.get 5
                i32.xor
                local.tee 8
                i32.const -16843009
                i32.add
                local.get 8
                i32.const -1
                i32.xor
                i32.and
                i32.or
                i32.const -2139062144
                i32.and
                i32.eqz
                br_if 0 (;@6;)
              end
            end
            local.get 4
            local.get 3
            i32.gt_u
            br_if 1 (;@3;)
            local.get 2
            i32.const -1
            i32.add
            local.set 5
            local.get 1
            i32.const 255
            i32.and
            local.set 8
            loop  ;; label = @5
              block  ;; label = @6
                local.get 4
                br_if 0 (;@6;)
                i32.const 0
                local.set 6
                br 5 (;@1;)
              end
              local.get 5
              local.get 4
              i32.add
              local.set 6
              local.get 4
              i32.const -1
              i32.add
              local.set 4
              local.get 6
              i32.load8_u
              local.get 8
              i32.eq
              br_if 3 (;@2;)
              br 0 (;@5;)
            end
          end
          local.get 6
          local.get 3
          i32.const 1053408
          call $_ZN4core5slice5index26slice_start_index_len_fail17h4bfaad2f663cf380E
          unreachable
        end
        local.get 4
        local.get 3
        i32.const 1053424
        call $_ZN4core5slice5index24slice_end_index_len_fail17h9bcf50050671ed30E
        unreachable
      end
      i32.const 1
      local.set 6
    end
    local.get 0
    local.get 4
    i32.store offset=4
    local.get 0
    local.get 6
    i32.store)
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h0a105c0c144e43f9E (type 1) (param i32 i32)
    local.get 0
    i64.const -5918158352840079641
    i64.store offset=8
    local.get 0
    i64.const 439319701636951332
    i64.store)
  (func $_ZN73_$LT$core..panic..panic_info..PanicInfo$u20$as$u20$core..fmt..Display$GT$3fmt17hbb48b73a4a2a8746E (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    i32.const 1
    local.set 3
    block  ;; label = @1
      local.get 1
      i32.load offset=20
      local.tee 4
      i32.const 1053440
      i32.const 12
      local.get 1
      i32.load offset=24
      local.tee 5
      i32.load offset=12
      local.tee 6
      call_indirect (type 3)
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=12
      local.set 1
      local.get 2
      i32.const 60
      i32.add
      i32.const 8
      i32.store
      local.get 2
      i32.const 40
      i32.add
      i32.const 12
      i32.add
      i32.const 8
      i32.store
      local.get 2
      i32.const 3
      i32.store offset=20
      local.get 2
      i32.const 1053928
      i32.store offset=16
      local.get 2
      i64.const 3
      i64.store offset=28 align=4
      local.get 2
      local.get 1
      i32.const 12
      i32.add
      i32.store offset=56
      local.get 2
      local.get 1
      i32.const 8
      i32.add
      i32.store offset=48
      local.get 2
      i32.const 60
      i32.store offset=44
      local.get 2
      local.get 1
      i32.store offset=40
      local.get 2
      local.get 2
      i32.const 40
      i32.add
      i32.store offset=24
      local.get 4
      local.get 5
      local.get 2
      i32.const 16
      i32.add
      call $_ZN4core3fmt5write17h55b62ec8489b4effE
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load offset=8
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          i32.const 1053452
          i32.const 2
          local.get 6
          call_indirect (type 3)
          br_if 2 (;@1;)
          local.get 2
          i32.const 40
          i32.add
          i32.const 16
          i32.add
          local.get 1
          i32.const 16
          i32.add
          i64.load align=4
          i64.store
          local.get 2
          i32.const 40
          i32.add
          i32.const 8
          i32.add
          local.get 1
          i32.const 8
          i32.add
          i64.load align=4
          i64.store
          local.get 2
          local.get 1
          i64.load align=4
          i64.store offset=40
          local.get 4
          local.get 5
          local.get 2
          i32.const 40
          i32.add
          call $_ZN4core3fmt5write17h55b62ec8489b4effE
          i32.eqz
          br_if 1 (;@2;)
          br 2 (;@1;)
        end
        local.get 2
        local.get 0
        i32.load
        local.tee 1
        local.get 0
        i32.load offset=4
        i32.const 12
        i32.add
        i32.load
        call_indirect (type 1)
        local.get 2
        i64.load
        i64.const -163230743173927068
        i64.ne
        br_if 0 (;@2;)
        local.get 2
        i64.load offset=8
        i64.const -4493808902380553279
        i64.ne
        br_if 0 (;@2;)
        local.get 4
        i32.const 1053452
        i32.const 2
        local.get 6
        call_indirect (type 3)
        br_if 1 (;@1;)
        local.get 4
        local.get 1
        i32.load
        local.get 1
        i32.load offset=4
        local.get 6
        call_indirect (type 3)
        br_if 1 (;@1;)
      end
      i32.const 0
      local.set 3
    end
    local.get 2
    i32.const 64
    i32.add
    global.set $__stack_pointer
    local.get 3)
  (func $_ZN87_$LT$core..str..lossy..Utf8Chunks$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hda991ca6d6612cbfE (type 1) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 1
      i32.load offset=4
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.load
      local.set 3
      i32.const 0
      local.set 4
      block  ;; label = @2
        loop  ;; label = @3
          local.get 4
          i32.const 1
          i32.add
          local.set 5
          block  ;; label = @4
            block  ;; label = @5
              local.get 3
              local.get 4
              i32.add
              i32.load8_u
              local.tee 6
              i32.extend8_s
              local.tee 7
              i32.const -1
              i32.le_s
              br_if 0 (;@5;)
              local.get 5
              local.set 4
              br 1 (;@4;)
            end
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 6
                                  i32.const 1053454
                                  i32.add
                                  i32.load8_u
                                  i32.const -2
                                  i32.add
                                  br_table 0 (;@15;) 1 (;@14;) 2 (;@13;) 13 (;@2;)
                                end
                                local.get 3
                                local.get 5
                                i32.add
                                i32.const 1053710
                                local.get 5
                                local.get 2
                                i32.lt_u
                                select
                                i32.load8_u
                                i32.const 192
                                i32.and
                                i32.const 128
                                i32.ne
                                br_if 12 (;@2;)
                                local.get 4
                                i32.const 2
                                i32.add
                                local.set 4
                                br 10 (;@4;)
                              end
                              local.get 3
                              local.get 5
                              i32.add
                              i32.const 1053710
                              local.get 5
                              local.get 2
                              i32.lt_u
                              select
                              i32.load8_s
                              local.set 8
                              local.get 6
                              i32.const -224
                              i32.add
                              br_table 1 (;@12;) 3 (;@10;) 3 (;@10;) 3 (;@10;) 3 (;@10;) 3 (;@10;) 3 (;@10;) 3 (;@10;) 3 (;@10;) 3 (;@10;) 3 (;@10;) 3 (;@10;) 3 (;@10;) 2 (;@11;) 3 (;@10;)
                            end
                            local.get 3
                            local.get 5
                            i32.add
                            i32.const 1053710
                            local.get 5
                            local.get 2
                            i32.lt_u
                            select
                            i32.load8_s
                            local.set 8
                            local.get 6
                            i32.const -240
                            i32.add
                            br_table 4 (;@8;) 3 (;@9;) 3 (;@9;) 3 (;@9;) 5 (;@7;) 3 (;@9;)
                          end
                          local.get 8
                          i32.const -32
                          i32.and
                          i32.const -96
                          i32.ne
                          br_if 9 (;@2;)
                          br 6 (;@5;)
                        end
                        local.get 8
                        i32.const -97
                        i32.gt_s
                        br_if 8 (;@2;)
                        br 5 (;@5;)
                      end
                      block  ;; label = @10
                        local.get 7
                        i32.const 31
                        i32.add
                        i32.const 255
                        i32.and
                        i32.const 12
                        i32.lt_u
                        br_if 0 (;@10;)
                        local.get 7
                        i32.const -2
                        i32.and
                        i32.const -18
                        i32.ne
                        br_if 8 (;@2;)
                        local.get 8
                        i32.const -64
                        i32.ge_s
                        br_if 8 (;@2;)
                        br 5 (;@5;)
                      end
                      local.get 8
                      i32.const -64
                      i32.ge_s
                      br_if 7 (;@2;)
                      br 4 (;@5;)
                    end
                    local.get 7
                    i32.const 15
                    i32.add
                    i32.const 255
                    i32.and
                    i32.const 2
                    i32.gt_u
                    br_if 6 (;@2;)
                    local.get 8
                    i32.const -64
                    i32.ge_s
                    br_if 6 (;@2;)
                    br 2 (;@6;)
                  end
                  local.get 8
                  i32.const 112
                  i32.add
                  i32.const 255
                  i32.and
                  i32.const 48
                  i32.ge_u
                  br_if 5 (;@2;)
                  br 1 (;@6;)
                end
                local.get 8
                i32.const -113
                i32.gt_s
                br_if 4 (;@2;)
              end
              local.get 3
              local.get 4
              i32.const 2
              i32.add
              local.tee 5
              i32.add
              i32.const 1053710
              local.get 5
              local.get 2
              i32.lt_u
              select
              i32.load8_u
              i32.const 192
              i32.and
              i32.const 128
              i32.ne
              br_if 3 (;@2;)
              local.get 3
              local.get 4
              i32.const 3
              i32.add
              local.tee 5
              i32.add
              i32.const 1053710
              local.get 5
              local.get 2
              i32.lt_u
              select
              i32.load8_u
              i32.const 192
              i32.and
              i32.const 128
              i32.ne
              br_if 3 (;@2;)
              local.get 4
              i32.const 4
              i32.add
              local.set 4
              br 1 (;@4;)
            end
            local.get 3
            local.get 4
            i32.const 2
            i32.add
            local.tee 5
            i32.add
            i32.const 1053710
            local.get 5
            local.get 2
            i32.lt_u
            select
            i32.load8_u
            i32.const 192
            i32.and
            i32.const 128
            i32.ne
            br_if 2 (;@2;)
            local.get 4
            i32.const 3
            i32.add
            local.set 4
          end
          local.get 4
          local.set 5
          local.get 4
          local.get 2
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 0
      local.get 4
      i32.store offset=4
      local.get 0
      local.get 3
      i32.store
      local.get 1
      local.get 2
      local.get 5
      i32.sub
      i32.store offset=4
      local.get 1
      local.get 3
      local.get 5
      i32.add
      i32.store
      local.get 0
      local.get 5
      local.get 4
      i32.sub
      i32.store offset=12
      local.get 0
      local.get 3
      local.get 4
      i32.add
      i32.store offset=8
      return
    end
    local.get 0
    i32.const 0
    i32.store)
  (func $_ZN4core3str5count14do_count_chars17hc7dd2f4211067435E (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        local.get 0
        i32.const 3
        i32.add
        i32.const -4
        i32.and
        local.tee 2
        local.get 0
        i32.sub
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 1
        local.get 3
        i32.sub
        local.tee 4
        i32.const 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 4
        i32.const 3
        i32.and
        local.set 5
        i32.const 0
        local.set 6
        i32.const 0
        local.set 1
        block  ;; label = @3
          local.get 2
          local.get 0
          i32.eq
          local.tee 7
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              local.get 2
              i32.sub
              local.tee 8
              i32.const -4
              i32.le_u
              br_if 0 (;@5;)
              i32.const 0
              local.set 9
              br 1 (;@4;)
            end
            i32.const 0
            local.set 9
            loop  ;; label = @5
              local.get 1
              local.get 0
              local.get 9
              i32.add
              local.tee 2
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 2
              i32.const 1
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 2
              i32.const 2
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 2
              i32.const 3
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.set 1
              local.get 9
              i32.const 4
              i32.add
              local.tee 9
              br_if 0 (;@5;)
            end
          end
          local.get 7
          br_if 0 (;@3;)
          local.get 0
          local.get 9
          i32.add
          local.set 2
          loop  ;; label = @4
            local.get 1
            local.get 2
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 1
            local.get 2
            i32.const 1
            i32.add
            local.set 2
            local.get 8
            i32.const 1
            i32.add
            local.tee 8
            br_if 0 (;@4;)
          end
        end
        local.get 0
        local.get 3
        i32.add
        local.set 9
        block  ;; label = @3
          local.get 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 9
          local.get 4
          i32.const -4
          i32.and
          i32.add
          local.tee 2
          i32.load8_s
          i32.const -65
          i32.gt_s
          local.set 6
          local.get 5
          i32.const 1
          i32.eq
          br_if 0 (;@3;)
          local.get 6
          local.get 2
          i32.load8_s offset=1
          i32.const -65
          i32.gt_s
          i32.add
          local.set 6
          local.get 5
          i32.const 2
          i32.eq
          br_if 0 (;@3;)
          local.get 6
          local.get 2
          i32.load8_s offset=2
          i32.const -65
          i32.gt_s
          i32.add
          local.set 6
        end
        local.get 4
        i32.const 2
        i32.shr_u
        local.set 3
        local.get 6
        local.get 1
        i32.add
        local.set 8
        loop  ;; label = @3
          local.get 9
          local.set 4
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          i32.const 192
          local.get 3
          i32.const 192
          i32.lt_u
          select
          local.tee 6
          i32.const 3
          i32.and
          local.set 7
          local.get 6
          i32.const 2
          i32.shl
          local.set 5
          i32.const 0
          local.set 2
          block  ;; label = @4
            local.get 3
            i32.const 4
            i32.lt_u
            br_if 0 (;@4;)
            local.get 4
            local.get 5
            i32.const 1008
            i32.and
            i32.add
            local.set 0
            i32.const 0
            local.set 2
            local.get 4
            local.set 1
            loop  ;; label = @5
              local.get 1
              i32.load
              local.tee 9
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 9
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              local.get 2
              i32.add
              local.get 1
              i32.load offset=4
              local.tee 2
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 2
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              i32.add
              local.get 1
              i32.load offset=8
              local.tee 2
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 2
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              i32.add
              local.get 1
              i32.load offset=12
              local.tee 2
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 2
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              i32.add
              local.set 2
              local.get 1
              i32.const 16
              i32.add
              local.tee 1
              local.get 0
              i32.ne
              br_if 0 (;@5;)
            end
          end
          local.get 3
          local.get 6
          i32.sub
          local.set 3
          local.get 4
          local.get 5
          i32.add
          local.set 9
          local.get 2
          i32.const 8
          i32.shr_u
          i32.const 16711935
          i32.and
          local.get 2
          i32.const 16711935
          i32.and
          i32.add
          i32.const 65537
          i32.mul
          i32.const 16
          i32.shr_u
          local.get 8
          i32.add
          local.set 8
          local.get 7
          i32.eqz
          br_if 0 (;@3;)
        end
        local.get 4
        local.get 6
        i32.const 252
        i32.and
        i32.const 2
        i32.shl
        i32.add
        local.tee 2
        i32.load
        local.tee 1
        i32.const -1
        i32.xor
        i32.const 7
        i32.shr_u
        local.get 1
        i32.const 6
        i32.shr_u
        i32.or
        i32.const 16843009
        i32.and
        local.set 1
        block  ;; label = @3
          local.get 7
          i32.const 1
          i32.eq
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=4
          local.tee 9
          i32.const -1
          i32.xor
          i32.const 7
          i32.shr_u
          local.get 9
          i32.const 6
          i32.shr_u
          i32.or
          i32.const 16843009
          i32.and
          local.get 1
          i32.add
          local.set 1
          local.get 7
          i32.const 2
          i32.eq
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=8
          local.tee 2
          i32.const -1
          i32.xor
          i32.const 7
          i32.shr_u
          local.get 2
          i32.const 6
          i32.shr_u
          i32.or
          i32.const 16843009
          i32.and
          local.get 1
          i32.add
          local.set 1
        end
        local.get 1
        i32.const 8
        i32.shr_u
        i32.const 459007
        i32.and
        local.get 1
        i32.const 16711935
        i32.and
        i32.add
        i32.const 65537
        i32.mul
        i32.const 16
        i32.shr_u
        local.get 8
        i32.add
        return
      end
      block  ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        i32.const 0
        return
      end
      local.get 1
      i32.const 3
      i32.and
      local.set 9
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.const 4
          i32.ge_u
          br_if 0 (;@3;)
          i32.const 0
          local.set 8
          i32.const 0
          local.set 2
          br 1 (;@2;)
        end
        local.get 1
        i32.const -4
        i32.and
        local.set 3
        i32.const 0
        local.set 8
        i32.const 0
        local.set 2
        loop  ;; label = @3
          local.get 8
          local.get 0
          local.get 2
          i32.add
          local.tee 1
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.get 1
          i32.const 1
          i32.add
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.get 1
          i32.const 2
          i32.add
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.get 1
          i32.const 3
          i32.add
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.set 8
          local.get 3
          local.get 2
          i32.const 4
          i32.add
          local.tee 2
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 9
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 8
        local.get 1
        i32.load8_s
        i32.const -65
        i32.gt_s
        i32.add
        local.set 8
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 9
        i32.const -1
        i32.add
        local.tee 9
        br_if 0 (;@2;)
      end
    end
    local.get 8)
  (func $_ZN4core3fmt3num3imp7fmt_u6417h3b7bbe8f178c4c80E.llvm.7982189259866861802 (type 14) (param i64 i32 i32) (result i32)
    (local i32 i32 i64 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    i32.const 39
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i64.const 10000
        i64.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.set 5
        br 1 (;@1;)
      end
      i32.const 39
      local.set 4
      loop  ;; label = @2
        local.get 3
        i32.const 9
        i32.add
        local.get 4
        i32.add
        local.tee 6
        i32.const -4
        i32.add
        local.get 0
        local.get 0
        i64.const 10000
        i64.div_u
        local.tee 5
        i64.const 10000
        i64.mul
        i64.sub
        i32.wrap_i64
        local.tee 7
        i32.const 65535
        i32.and
        i32.const 100
        i32.div_u
        local.tee 8
        i32.const 1
        i32.shl
        i32.const 1053064
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        local.get 6
        i32.const -2
        i32.add
        local.get 7
        local.get 8
        i32.const 100
        i32.mul
        i32.sub
        i32.const 65535
        i32.and
        i32.const 1
        i32.shl
        i32.const 1053064
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        local.get 4
        i32.const -4
        i32.add
        local.set 4
        local.get 0
        i64.const 99999999
        i64.gt_u
        local.set 6
        local.get 5
        local.set 0
        local.get 6
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 5
      i32.wrap_i64
      local.tee 6
      i32.const 99
      i32.le_u
      br_if 0 (;@1;)
      local.get 3
      i32.const 9
      i32.add
      local.get 4
      i32.const -2
      i32.add
      local.tee 4
      i32.add
      local.get 5
      i32.wrap_i64
      local.tee 6
      local.get 6
      i32.const 65535
      i32.and
      i32.const 100
      i32.div_u
      local.tee 6
      i32.const 100
      i32.mul
      i32.sub
      i32.const 65535
      i32.and
      i32.const 1
      i32.shl
      i32.const 1053064
      i32.add
      i32.load16_u align=1
      i32.store16 align=1
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 6
        i32.const 10
        i32.lt_u
        br_if 0 (;@2;)
        local.get 3
        i32.const 9
        i32.add
        local.get 4
        i32.const -2
        i32.add
        local.tee 4
        i32.add
        local.get 6
        i32.const 1
        i32.shl
        i32.const 1053064
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        br 1 (;@1;)
      end
      local.get 3
      i32.const 9
      i32.add
      local.get 4
      i32.const -1
      i32.add
      local.tee 4
      i32.add
      local.get 6
      i32.const 48
      i32.or
      i32.store8
    end
    local.get 2
    local.get 1
    i32.const 1053712
    i32.const 0
    local.get 3
    i32.const 9
    i32.add
    local.get 4
    i32.add
    i32.const 39
    local.get 4
    i32.sub
    call $_ZN4core3fmt9Formatter12pad_integral17h0f3b9f3b71d03c2bE
    local.set 4
    local.get 3
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 4)
  (func $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$i32$GT$3fmt17h0d225e8f6f3c78c6E (type 2) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    i32.load
    local.tee 0
    local.get 0
    i32.const 31
    i32.shr_s
    local.tee 2
    i32.xor
    local.get 2
    i32.sub
    i64.extend_i32_u
    local.get 0
    i32.const -1
    i32.xor
    i32.const 31
    i32.shr_u
    local.get 1
    call $_ZN4core3fmt3num3imp7fmt_u6417h3b7bbe8f178c4c80E.llvm.7982189259866861802)
  (func $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hba80b56c6635a03fE (type 2) (param i32 i32) (result i32)
    local.get 0
    i64.load32_u
    i32.const 1
    local.get 1
    call $_ZN4core3fmt3num3imp7fmt_u6417h3b7bbe8f178c4c80E.llvm.7982189259866861802)
  (func $_ZN63_$LT$core..cell..BorrowMutError$u20$as$u20$core..fmt..Debug$GT$3fmt17h7b6815a6f9ee6c49E (type 2) (param i32 i32) (result i32)
    local.get 1
    i32.load offset=20
    i32.const 1053712
    i32.const 14
    local.get 1
    i32.load offset=24
    i32.load offset=12
    call_indirect (type 3))
  (func $_ZN4core4cell22panic_already_borrowed17hfa55c2be5c5c6eb4E (type 0) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 1
    i32.store offset=16
    local.get 1
    i32.const 1053744
    i32.store offset=12
    local.get 1
    i64.const 1
    i64.store offset=24 align=4
    local.get 1
    i32.const 61
    i32.store offset=40
    local.get 1
    local.get 1
    i32.const 36
    i32.add
    i32.store offset=20
    local.get 1
    local.get 1
    i32.const 47
    i32.add
    i32.store offset=36
    local.get 1
    i32.const 12
    i32.add
    local.get 0
    call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
    unreachable)
  (func $_ZN4core6option13unwrap_failed17h7da440408d6f3f41E (type 0) (param i32)
    i32.const 1053752
    i32.const 43
    local.get 0
    call $_ZN4core9panicking5panic17h5183d2125e960738E
    unreachable)
  (func $_ZN4core6option13expect_failed17hc92345a96811243cE (type 6) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 1
    i32.store offset=12
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call $_ZN4core9panicking13panic_display17hfad406ac5ff98458E
    unreachable)
  (func $_ZN4core9panicking13panic_display17hfad406ac5ff98458E (type 1) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 1
    i32.store offset=4
    local.get 2
    i32.const 1053796
    i32.store
    local.get 2
    i64.const 1
    i64.store offset=12 align=4
    local.get 2
    i32.const 60
    i32.store offset=28
    local.get 2
    local.get 0
    i32.store offset=24
    local.get 2
    local.get 2
    i32.const 24
    i32.add
    i32.store offset=8
    local.get 2
    local.get 1
    call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
    unreachable)
  (func $_ZN4core6result13unwrap_failed17ha1a4a677361ebda3E (type 15) (param i32 i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    local.get 5
    local.get 1
    i32.store offset=12
    local.get 5
    local.get 0
    i32.store offset=8
    local.get 5
    local.get 3
    i32.store offset=20
    local.get 5
    local.get 2
    i32.store offset=16
    local.get 5
    i32.const 60
    i32.add
    i32.const 62
    i32.store
    local.get 5
    i32.const 2
    i32.store offset=28
    local.get 5
    i32.const 1053808
    i32.store offset=24
    local.get 5
    i64.const 2
    i64.store offset=36 align=4
    local.get 5
    i32.const 60
    i32.store offset=52
    local.get 5
    local.get 5
    i32.const 48
    i32.add
    i32.store offset=32
    local.get 5
    local.get 5
    i32.const 16
    i32.add
    i32.store offset=56
    local.get 5
    local.get 5
    i32.const 8
    i32.add
    i32.store offset=48
    local.get 5
    i32.const 24
    i32.add
    local.get 4
    call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
    unreachable)
  (func $_ZN4core5slice5index24slice_end_index_len_fail17h9bcf50050671ed30E (type 6) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN4core5slice5index27slice_end_index_len_fail_rt17h97bf3a7cb4ee590cE
    unreachable)
  (func $_ZN4core5slice5index26slice_start_index_len_fail17h4bfaad2f663cf380E (type 6) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN4core5slice5index29slice_start_index_len_fail_rt17h8d73f493a4c5849fE
    unreachable)
  (func $_ZN4core5slice5index29slice_start_index_len_fail_rt17h8d73f493a4c5849fE (type 6) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 0
    i32.store
    local.get 3
    i32.const 44
    i32.add
    i32.const 8
    i32.store
    local.get 3
    i32.const 2
    i32.store offset=12
    local.get 3
    i32.const 1053876
    i32.store offset=8
    local.get 3
    i64.const 2
    i64.store offset=20 align=4
    local.get 3
    i32.const 8
    i32.store offset=36
    local.get 3
    local.get 3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 3
    local.get 3
    i32.const 4
    i32.add
    i32.store offset=40
    local.get 3
    local.get 3
    i32.store offset=32
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
    unreachable)
  (func $_ZN4core5slice5index27slice_end_index_len_fail_rt17h97bf3a7cb4ee590cE (type 6) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 0
    i32.store
    local.get 3
    i32.const 44
    i32.add
    i32.const 8
    i32.store
    local.get 3
    i32.const 2
    i32.store offset=12
    local.get 3
    i32.const 1053908
    i32.store offset=8
    local.get 3
    i64.const 2
    i64.store offset=20 align=4
    local.get 3
    i32.const 8
    i32.store offset=36
    local.get 3
    local.get 3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 3
    local.get 3
    i32.const 4
    i32.add
    i32.store offset=40
    local.get 3
    local.get 3
    i32.store offset=32
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call $_ZN4core9panicking9panic_fmt17h8e5b61104cc0f29bE
    unreachable)
  (func $_ZN4core3ops8function6FnOnce9call_once17hc6d1905079f8f33bE.llvm.16891890523046555270 (type 2) (param i32 i32) (result i32)
    local.get 0
    i32.load
    drop
    loop (result i32)  ;; label = @1
      br 0 (;@1;)
    end)
  (func $__multi3 (type 16) (param i32 i64 i64 i64 i64)
    (local i64 i64 i64 i64 i64 i64)
    local.get 0
    local.get 3
    i64.const 4294967295
    i64.and
    local.tee 5
    local.get 1
    i64.const 4294967295
    i64.and
    local.tee 6
    i64.mul
    local.tee 7
    local.get 3
    i64.const 32
    i64.shr_u
    local.tee 8
    local.get 6
    i64.mul
    local.tee 6
    local.get 5
    local.get 1
    i64.const 32
    i64.shr_u
    local.tee 9
    i64.mul
    i64.add
    local.tee 5
    i64.const 32
    i64.shl
    i64.add
    local.tee 10
    i64.store
    local.get 0
    local.get 8
    local.get 9
    i64.mul
    local.get 5
    local.get 6
    i64.lt_u
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 5
    i64.const 32
    i64.shr_u
    i64.or
    i64.add
    local.get 10
    local.get 7
    i64.lt_u
    i64.extend_i32_u
    i64.add
    local.get 4
    local.get 1
    i64.mul
    local.get 3
    local.get 2
    i64.mul
    i64.add
    i64.add
    i64.store offset=8)
  (table (;0;) 63 63 funcref)
  (global $__stack_pointer (mut i32) (i32.const 1048576))
  (global $__tls_base (mut i32) (i32.const 0))
  (global $__tls_size i32 (i32.const 24))
  (global $__tls_align i32 (i32.const 4))
  (global (;4;) i32 (i32.const 1054480))
  (global (;5;) i32 (i32.const 1054480))
  (export "__tls_base" (global $__tls_base))
  (export "__tls_size" (global $__tls_size))
  (export "__tls_align" (global $__tls_align))
  (export "__wasm_init_tls" (func $__wasm_init_tls))
  (export "_start" (func $_start))
  (export "__data_end" (global 4))
  (export "__heap_base" (global 5))
  (start $__wasm_init_memory)
  (elem (;0;) (i32.const 1) func $_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17hfb89e3d6c2568f08E.llvm.12628461014352780869 $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17hed41479ee867d133E $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h52d87c11c795cdddE $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17had9e027a1aa3b2ccE $_ZN4core3fmt5Write9write_fmt17ha9ac37fb789f75c0E $_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17hfb89e3d6c2568f08E $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17hcdd6221b2f2b34a3E $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17hba80b56c6635a03fE $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17hed41479ee867d133E.1 $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h52d87c11c795cdddE.1 $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17had9e027a1aa3b2ccE.1 $_ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17ha872a7de228e8298E $_ZN53_$LT$core..fmt..Error$u20$as$u20$core..fmt..Debug$GT$3fmt17haf1074f0f9151d42E $_ZN4core3ops8function6FnOnce40call_once$u7b$$u7b$vtable.shim$u7d$$u7d$17hbd22de30bea3fa42E $_ZN10bootloader6_start28_$u7b$$u7b$closure$u7d$$u7d$17h7bcceeaf4923263bE $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h3bceb8e6c5131c36E $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h52d87c11c795cdddE.2 $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17had9e027a1aa3b2ccE.2 $_ZN4core3fmt5Write9write_fmt17hfacdb15f35c6f2c4E $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h6e31f183a6d51aa5E $_ZN4core3ptr28drop_in_place$LT$$RF$str$GT$17h800211bd58f2cc07E $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h523f35a5a41ea52fE $_ZN4core3ptr88drop_in_place$LT$core..panic..panic_info..PanicInfo..internal_constructor..NoPayload$GT$17h2ef38da117d3f36eE.llvm.13317409777152324161 $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17ha7f99a7273f54626E $_ZN3std5alloc24default_alloc_error_hook17hb10cd7b0607bc6b3E $_ZN60_$LT$std..io..error..Error$u20$as$u20$core..fmt..Display$GT$3fmt17hf06d594d26b2c655E $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h90d667b75783d2e8E $_ZN4core3ptr89drop_in_place$LT$std..io..Write..write_fmt..Adapter$LT$std..io..stdio..StderrLock$GT$$GT$17hcd5e79da3f92767bE $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17h846113e4f2abcc3dE $_ZN4core3fmt5Write10write_char17h8fc7d1480738044bE $_ZN4core3fmt5Write9write_fmt17h22fbf674e3ba7d8eE $_ZN4core3ptr88drop_in_place$LT$std..io..Write..write_fmt..Adapter$LT$alloc..vec..Vec$LT$u8$GT$$GT$$GT$17h04373aee67a077a9E.llvm.9660907189867844885 $_ZN80_$LT$std..io..Write..write_fmt..Adapter$LT$T$GT$$u20$as$u20$core..fmt..Write$GT$9write_str17ha64215833ac6d838E $_ZN4core3fmt5Write10write_char17hc89cc9fd0af3e181E $_ZN4core3fmt5Write9write_fmt17h11b5748d5310bc97E $_ZN4core3ptr88drop_in_place$LT$std..io..Write..write_fmt..Adapter$LT$alloc..vec..Vec$LT$u8$GT$$GT$$GT$17h04373aee67a077a9E $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$i32$GT$3fmt17h0d225e8f6f3c78c6E $_ZN60_$LT$alloc..string..String$u20$as$u20$core..fmt..Display$GT$3fmt17hfb89e3d6c2568f08E.1 $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h3bceb8e6c5131c36E.1 $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h52d87c11c795cdddE.3 $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17had9e027a1aa3b2ccE.3 $_ZN4core3ptr28drop_in_place$LT$$RF$str$GT$17h800211bd58f2cc07E.1 $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17h232c2c2ffc092594E $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17h2d0fadd3ac8bb5afE $_ZN4core3ptr77drop_in_place$LT$std..panicking..begin_panic_handler..FormatStringPayload$GT$17ha4b1fec6326a7cf9E $_ZN102_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17heffe0194a79480cdE $_ZN102_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17h978c60e35d9b2e5fE $_ZN4core3ptr205drop_in_place$LT$$LT$alloc..boxed..Box$LT$dyn$u20$core..error..Error$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$u20$as$u20$core..convert..From$LT$alloc..string..String$GT$$GT$..from..StringError$GT$17h2008b045d902326fE $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h52d87c11c795cdddE.4 $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17had9e027a1aa3b2ccE.4 $_ZN4core3fmt5Write9write_fmt17hed59aef0e547cad5E $_ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17h3fa5012f7cea22daE $_ZN53_$LT$core..fmt..Error$u20$as$u20$core..fmt..Debug$GT$3fmt17haf1074f0f9151d42E.1 $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17h347df457801b2e1fE $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h52d87c11c795cdddE.5 $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17had9e027a1aa3b2ccE.5 $_ZN4core3ops8function6FnOnce9call_once17hc6d1905079f8f33bE.llvm.16891890523046555270 $_ZN4core3ptr88drop_in_place$LT$core..panic..panic_info..PanicInfo..internal_constructor..NoPayload$GT$17hbcc9e157a10fdfcaE $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h0a105c0c144e43f9E $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h3311e449c4f06445E $_ZN63_$LT$core..cell..BorrowMutError$u20$as$u20$core..fmt..Debug$GT$3fmt17h7b6815a6f9ee6c49E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h7444cfe9f847f71eE)
  (data $.tdata "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00")
  (data $.rodata "\0a\00\00\00\18\00\10\00\00\00\00\00\18\00\10\00\01\00\00\00\02\00\00\00\0c\00\00\00\04\00\00\00\03\00\00\00\04\00\00\00\05\00\00\00\09\00\00\00\0c\00\00\00\04\00\00\00\0a\00\00\00\0b\00\00\00\05\00\00\00a Display implementation returned an error unexpectedly\00\0c\00\00\00\00\00\00\00\01\00\00\00\0d\00\00\00/home/lara/.rustup/toolchains/nightly-2024-03-16-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/alloc/src/string.rs\00\00\a4\00\10\00z\00\00\00\fa\09\00\00\0e\00\00\00Error\00\00\00\0c\00\00\00\00\00\00\00\01\00\00\00\0e\00\00\00\0f\00\00\00\0f\00\00\00Hi!\0aP\01\10\00\04\00\00\00Booting into HoneyOSBoot completed!\000\01\10\00\00\00\00\00                                                    \0a.-..-.                         .--.  .--.   Developed by GetAGripGal\0a: :; :                        : ,. :: .--'  ---------------------------\0a:    : .--. ,-.,-. .--. .-..-.: :: :`. `.   Welcome to HoneyOS!\0a: :: :' .; :: ,. :' '_.': :; :: :; : _`, :  ---------------------------\0a:_;:_;`.__.':_;:_;`.__.'`._. ;`.__.'`.__.'  \0a                         .-. :\0a                         `._.'\0a\00\00\00\88\01\10\00\b5\01\00\00Bootloader ptr: H\03\10\00\10\00\00\00Bootloader pid: `\03\10\00\10\00\00\00Settup en environment: []\00\00\000\01\10\00\00\00\00\00\90\03\10\00\01\00\00\00 *\00\000\01\10\00\00\00\00\000\01\10\00\00\00\00\00\10\00\00\00\0c\00\00\00\04\00\00\00\11\00\00\00\12\00\00\00\13\00\00\00cannot modify the panic hook from a panicking thread\d0\03\10\004\00\00\00/home/lara/.rustup/toolchains/nightly-2024-03-16-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/std/src/panicking.rs\00\0c\04\10\00{\00\00\00\87\00\00\00\09\00\00\00\0c\04\10\00{\00\00\00\84\02\00\00\1e\00\00\00\10\00\00\00\0c\00\00\00\04\00\00\00\14\00\00\00\15\00\00\00\08\00\00\00\04\00\00\00\16\00\00\00\17\00\00\00\00\00\00\00\01\00\00\00\18\00\00\00memory allocation of  bytes failed\00\00\d8\04\10\00\15\00\00\00\ed\04\10\00\0d\00\00\00/home/lara/.rustup/toolchains/nightly-2024-03-16-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/std/src/alloc.rs\00\0c\05\10\00w\00\00\00b\01\00\00\09\00\00\00/home/lara/.rustup/toolchains/nightly-2024-03-16-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/std/src/sync/once.rs\00\94\05\10\00{\00\00\00\d0\00\00\00\14\00\00\00\94\05\10\00{\00\00\00\d0\00\00\001\00\00\00lock count overflow in reentrant mutex/home/lara/.rustup/toolchains/nightly-2024-03-16-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/std/src/sync/reentrant_lock.rs\00V\06\10\00\85\00\00\00\bc\00\00\00-\00\00\00internal error: entered unreachable code: state is never set to invalid values\00\00\ec\06\10\00N\00\00\00too many active read locks on RwLockD\07\10\00$\00\00\00/home/lara/.rustup/toolchains/nightly-2024-03-16-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/std/src/sys/sync/rwlock/futex.rs\00p\07\10\00\87\00\00\00{\00\00\00\11\00\00\00assertion failed: is_unlocked(state)p\07\10\00\87\00\00\00\e7\00\00\00\09\00\00\00/home/lara/.rustup/toolchains/nightly-2024-03-16-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/std/src/io/buffered/linewritershim.rsmid > len\00\00\00\c8\08\10\00\09\00\00\00<\08\10\00\8c\00\00\00\0a\01\00\00)\00\00\00/home/lara/.rustup/toolchains/nightly-2024-03-16-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/std/src/io/stdio.rs\00\00\ec\08\10\00z\00\00\00\22\03\00\00\14\00\00\00failed printing to : \00\00\00x\09\10\00\13\00\00\00\8b\09\10\00\02\00\00\00\ec\08\10\00z\00\00\00@\04\00\00\09\00\00\00stdoutformatter error\00\00\00\b6\09\10\00\0f\00\00\00(\00\00\00\1c\00\00\00\0c\00\00\00\04\00\00\00\1d\00\00\00\1e\00\00\00\1f\00\00\00 \00\00\00\0c\00\00\00\04\00\00\00!\00\00\00\22\00\00\00#\00\00\00$\00\00\00\0c\00\00\00\04\00\00\00!\00\00\00\22\00\00\00#\00\00\00$\00\00\00\0c\00\00\00\04\00\00\00\1d\00\00\00\1e\00\00\00\1f\00\00\00entity not foundpermission deniedconnection refusedconnection resethost unreachablenetwork unreachableconnection abortednot connectedaddress in useaddress not availablenetwork downbroken pipeentity already existsoperation would blocknot a directoryis a directorydirectory not emptyread-only filesystem or storage mediumfilesystem loop or indirection limit (e.g. symlink loop)stale network file handleinvalid input parameterinvalid datatimed outwrite zerono storage spaceseek on unseekable filefilesystem quota exceededfile too largeresource busyexecutable file busydeadlockcross-device link or renametoo many linksinvalid filenameargument list too longoperation interruptedunsupportedunexpected end of fileout of memoryother erroruncategorized error (os error )\00\00\004\0a\10\00\00\00\00\00!\0d\10\00\0b\00\00\00,\0d\10\00\01\00\00\004\0a\10\00\00\00\00\00\10\00\00\00\11\00\00\00\12\00\00\00\10\00\00\00\10\00\00\00\13\00\00\00\12\00\00\00\0d\00\00\00\0e\00\00\00\15\00\00\00\0c\00\00\00\0b\00\00\00\15\00\00\00\15\00\00\00\0f\00\00\00\0e\00\00\00\13\00\00\00&\00\00\008\00\00\00\19\00\00\00\17\00\00\00\0c\00\00\00\09\00\00\00\0a\00\00\00\10\00\00\00\17\00\00\00\19\00\00\00\0e\00\00\00\0d\00\00\00\14\00\00\00\08\00\00\00\1b\00\00\00\0e\00\00\00\10\00\00\00\16\00\00\00\15\00\00\00\0b\00\00\00\16\00\00\00\0d\00\00\00\0b\00\00\00\13\00\00\004\0a\10\00D\0a\10\00U\0a\10\00g\0a\10\00w\0a\10\00\87\0a\10\00\9a\0a\10\00\ac\0a\10\00\b9\0a\10\00\c7\0a\10\00\dc\0a\10\00\e8\0a\10\00\f3\0a\10\00\08\0b\10\00\1d\0b\10\00,\0b\10\00:\0b\10\00M\0b\10\00s\0b\10\00\ab\0b\10\00\c4\0b\10\00\db\0b\10\00\e7\0b\10\00\f0\0b\10\00\fa\0b\10\00\0a\0c\10\00!\0c\10\00:\0c\10\00H\0c\10\00U\0c\10\00i\0c\10\00q\0c\10\00\8c\0c\10\00\9a\0c\10\00\aa\0c\10\00\c0\0c\10\00\d5\0c\10\00\e0\0c\10\00\f6\0c\10\00\03\0d\10\00\0e\0d\10\00/home/lara/.cargo/registry/src/index.crates.io-6f17d22bba15001f/dlmalloc-0.2.6/src/dlmalloc.rsassertion failed: psize >= size + min_overhead\98\0e\10\00^\00\00\00\a8\04\00\00\09\00\00\00assertion failed: psize <= size + max_overhead\00\00\98\0e\10\00^\00\00\00\ae\04\00\00\0d\00\00\00'\00\00\00\0c\00\00\00\04\00\00\00(\00\00\00)\00\00\00\13\00\00\00operation successful*\00\00\00\08\00\00\00\04\00\00\00\16\00\00\00*\00\00\00\08\00\00\00\04\00\00\00+\00\00\00,\00\00\00-\00\00\00\10\00\00\00\04\00\00\00.\00\00\00/\00\00\00Error\00\00\000\00\00\00\0c\00\00\00\04\00\00\001\00\00\002\00\00\003\00\00\00a formatting trait implementation returned an error\004\00\00\00\00\00\00\00\01\00\00\005\00\00\00/home/lara/.rustup/toolchains/nightly-2024-03-16-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/alloc/src/fmt.rs\00<\10\10\00w\00\00\00y\02\00\00 \00\00\006\00\00\00\0c\00\00\00\04\00\00\007\00\00\008\00\00\003\00\00\00\ef\bf\bd\00capacity overflow\00\00\00\e0\10\10\00\11\00\00\00/home/lara/.rustup/toolchains/nightly-2024-03-16-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/alloc/src/raw_vec.rs\00\fc\10\10\00{\00\00\00\19\00\00\00\05\00\00\0000010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899:\00\00\00\00\00\00\00\01\00\00\00;\00\00\00/home/lara/.rustup/toolchains/nightly-2024-03-16-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/slice/memchr.rs\00`\12\10\00\7f\00\00\00\83\00\00\00\1e\00\00\00`\12\10\00\7f\00\00\00\9f\00\00\00\09\00\00\00panicked at :\0a\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\04\04\04\04\04\00\00\00\00\00\00\00\00\00\00\00\00\00BorrowMutErroralready borrowed: \1e\14\10\00\12\00\00\00called `Option::unwrap()` on a `None` value\00\10\14\10\00\00\00\00\00: \00\00\10\14\10\00\00\00\00\00l\14\10\00\02\00\00\00range start index  out of range for slice of length \80\14\10\00\12\00\00\00\92\14\10\00\22\00\00\00range end index \c4\14\10\00\10\00\00\00\92\14\10\00\22\00\00\00:\00\00\00\e4\14\10\00\00\00\00\00\e4\14\10\00\01\00\00\00\e4\14\10\00\01\00\00\00"))
