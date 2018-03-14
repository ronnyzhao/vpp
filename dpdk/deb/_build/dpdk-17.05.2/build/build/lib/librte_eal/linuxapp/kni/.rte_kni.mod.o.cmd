cmd_/root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/build/lib/librte_eal/linuxapp/kni/rte_kni.mod.o := gcc -Wp,-MD,/root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/build/lib/librte_eal/linuxapp/kni/.rte_kni.mod.o.d  -nostdinc -isystem /usr/lib/gcc/aarch64-linux-gnu/5/include -I/usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include -I./arch/arm64/include/generated  -I/usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include -I./include -I/usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/uapi -I./arch/arm64/include/generated/uapi -I/usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi -I./include/generated/uapi -include /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/kconfig.h  -I/root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/build/lib/librte_eal/linuxapp/kni -I/root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/build/lib/librte_eal/linuxapp/kni -D__KERNEL__ -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -fno-PIE -mgeneral-regs-only -DCONFIG_AS_LSE=1 -fno-asynchronous-unwind-tables -mpc-relative-literal-loads -mabi=lp64 -fno-delete-null-pointer-checks -O2 --param=allow-store-data-races=0 -DCC_HAVE_ASM_GOTO -Wframe-larger-than=2048 -fno-stack-protector -Wno-unused-but-set-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -g -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init  -I/root/vpp/dpdk/deb/_build/dpdk-17.05.2/lib/librte_eal/linuxapp/kni --param max-inline-insns-single=50  -I/root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/include  -I/root/vpp/dpdk/deb/_build/dpdk-17.05.2/lib/librte_eal/linuxapp/kni/ethtool/ixgbe  -I/root/vpp/dpdk/deb/_build/dpdk-17.05.2/lib/librte_eal/linuxapp/kni/ethtool/igb -include /root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/include/rte_config.h -Wall -Werror -DUBUNTU_RELEASE_CODE=1604 -D"UBUNTU_KERNEL_CODE=UBUNTU_KERNEL_VERSION(4,14,11,1)"  -DKBUILD_BASENAME='"rte_kni.mod"'  -DKBUILD_MODNAME='"rte_kni"' -DMODULE -mcmodel=large  -c -o /root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/build/lib/librte_eal/linuxapp/kni/rte_kni.mod.o /root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/build/lib/librte_eal/linuxapp/kni/rte_kni.mod.c

source_/root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/build/lib/librte_eal/linuxapp/kni/rte_kni.mod.o := /root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/build/lib/librte_eal/linuxapp/kni/rte_kni.mod.c

deps_/root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/build/lib/librte_eal/linuxapp/kni/rte_kni.mod.o := \
    $(wildcard include/config/module/unload.h) \
  /root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/include/rte_config.h \
    $(wildcard include/config/h.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/module.h \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/modules/tree/lookup.h) \
    $(wildcard include/config/livepatch.h) \
    $(wildcard include/config/unused/symbols.h) \
    $(wildcard include/config/module/sig.h) \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/tracepoints.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
    $(wildcard include/config/constructors.h) \
    $(wildcard include/config/strict/module/rwx.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/types.h \
    $(wildcard include/config/have/uid16.h) \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/types.h \
  arch/arm64/include/generated/uapi/asm/types.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/asm-generic/types.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/int-ll64.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/asm-generic/int-ll64.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/uapi/asm/bitsperlong.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/bitsperlong.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/asm-generic/bitsperlong.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/posix_types.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/stddef.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/stddef.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/compiler_types.h \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
    $(wildcard include/config/gcov/kernel.h) \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/uapi/asm/posix_types.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/asm-generic/posix_types.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
    $(wildcard include/config/page/poisoning/zero.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/const.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/arch/has/refcount.h) \
    $(wildcard include/config/panic/timeout.h) \
  /usr/lib/gcc/aarch64-linux-gnu/5/include/stdarg.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/linkage.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/stringify.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/module/rel/crcs.h) \
    $(wildcard include/config/trim/unused/ksyms.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/linkage.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/compiler.h \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/stack/validation.h) \
    $(wildcard include/config/kasan.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/barrier.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/barrier.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/bitops.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/bitops.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/bitops/builtin-__ffs.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/bitops/builtin-ffs.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/bitops/builtin-__fls.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/bitops/builtin-fls.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/bitops/ffz.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/bitops/fls64.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/bitops/find.h \
    $(wildcard include/config/generic/find/first/bit.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/bitops/sched.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/bitops/hweight.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/bitops/arch_hweight.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/bitops/const_hweight.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/bitops/lock.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/bitops/non-atomic.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/bitops/le.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/uapi/asm/byteorder.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/byteorder/little_endian.h \
    $(wildcard include/config/cpu/big/endian.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/byteorder/little_endian.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/swab.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/swab.h \
  arch/arm64/include/generated/uapi/asm/swab.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/asm-generic/swab.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/byteorder/generic.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/typecheck.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/printk.h \
    $(wildcard include/config/message/loglevel/default.h) \
    $(wildcard include/config/console/loglevel/default.h) \
    $(wildcard include/config/early/printk.h) \
    $(wildcard include/config/printk/nmi.h) \
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/init.h \
    $(wildcard include/config/strict/kernel/rwx.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/kern_levels.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/kernel.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/sysinfo.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/cache.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/cputype.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/sysreg.h \
    $(wildcard include/config/broken/gas/inst.h) \
    $(wildcard include/config/arm64/4k/pages.h) \
    $(wildcard include/config/arm64/16k/pages.h) \
    $(wildcard include/config/arm64/64k/pages.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/build_bug.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/stat.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/stat.h \
    $(wildcard include/config/compat.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/uapi/asm/stat.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/asm-generic/stat.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/stat.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/seqlock.h \
    $(wildcard include/config/debug/lock/alloc.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/generic/lockbreak.h) \
    $(wildcard include/config/preempt.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/preempt.h \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  arch/arm64/include/generated/asm/preempt.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/preempt.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/thread_info.h \
    $(wildcard include/config/thread/info/in/task.h) \
    $(wildcard include/config/debug/stack/usage.h) \
    $(wildcard include/config/debug/kmemleak.h) \
    $(wildcard include/config/have/arch/within/stack/frames.h) \
    $(wildcard include/config/hardened/usercopy.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/bug.h \
    $(wildcard include/config/bug/on/data/corruption.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/bug.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/asm-bug.h \
    $(wildcard include/config/debug/bugverbose.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/brk-imm.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/restart_block.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/current.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/thread_info.h \
    $(wildcard include/config/arm64/sw/ttbr0/pan.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/memory.h \
    $(wildcard include/config/arm64/va/bits.h) \
    $(wildcard include/config/vmap/stack.h) \
    $(wildcard include/config/debug/align/rodata.h) \
    $(wildcard include/config/blk/dev/initrd.h) \
    $(wildcard include/config/debug/virtual.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/page-def.h \
    $(wildcard include/config/arm64/page/shift.h) \
    $(wildcard include/config/arm64/cont/shift.h) \
  arch/arm64/include/generated/asm/sizes.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/sizes.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/sizes.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/debug/vm/pgflags.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/pfn.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/stack_pointer.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/irqflags.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/ptrace.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/uapi/asm/ptrace.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/hwcap.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/uapi/asm/hwcap.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/ptrace.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/bottom_half.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/spinlock_types.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/spinlock_types.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/lockdep.h \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/lock/stat.h) \
    $(wildcard include/config/lockdep/crossrelease.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/rwlock_types.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/spinlock.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/lse.h \
    $(wildcard include/config/as/lse.h) \
    $(wildcard include/config/arm64/lse/atomics.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/processor.h \
    $(wildcard include/config/have/hw/breakpoint.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
    $(wildcard include/config/fortify/source.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/string.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/string.h \
    $(wildcard include/config/arch/has/uaccess/flushcache.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/alternative.h \
    $(wildcard include/config/arm64/uao.h) \
    $(wildcard include/config/foo.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/cpucaps.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/insn.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/fpsimd.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/hw_breakpoint.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/cpufeature.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/jump_label.h \
    $(wildcard include/config/jump/label.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/jump_label.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/virt.h \
    $(wildcard include/config/arm64/vhe.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/sections.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/sections.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/pgtable-hwdef.h \
    $(wildcard include/config/pgtable/levels.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/rwlock.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/spinlock_api_smp.h \
    $(wildcard include/config/inline/spin/lock.h) \
    $(wildcard include/config/inline/spin/lock/bh.h) \
    $(wildcard include/config/inline/spin/lock/irq.h) \
    $(wildcard include/config/inline/spin/lock/irqsave.h) \
    $(wildcard include/config/inline/spin/trylock.h) \
    $(wildcard include/config/inline/spin/trylock/bh.h) \
    $(wildcard include/config/uninline/spin/unlock.h) \
    $(wildcard include/config/inline/spin/unlock/bh.h) \
    $(wildcard include/config/inline/spin/unlock/irq.h) \
    $(wildcard include/config/inline/spin/unlock/irqrestore.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/rwlock_api_smp.h \
    $(wildcard include/config/inline/read/lock.h) \
    $(wildcard include/config/inline/write/lock.h) \
    $(wildcard include/config/inline/read/lock/bh.h) \
    $(wildcard include/config/inline/write/lock/bh.h) \
    $(wildcard include/config/inline/read/lock/irq.h) \
    $(wildcard include/config/inline/write/lock/irq.h) \
    $(wildcard include/config/inline/read/lock/irqsave.h) \
    $(wildcard include/config/inline/write/lock/irqsave.h) \
    $(wildcard include/config/inline/read/trylock.h) \
    $(wildcard include/config/inline/write/trylock.h) \
    $(wildcard include/config/inline/read/unlock.h) \
    $(wildcard include/config/inline/write/unlock.h) \
    $(wildcard include/config/inline/read/unlock/bh.h) \
    $(wildcard include/config/inline/write/unlock/bh.h) \
    $(wildcard include/config/inline/read/unlock/irq.h) \
    $(wildcard include/config/inline/write/unlock/irq.h) \
    $(wildcard include/config/inline/read/unlock/irqrestore.h) \
    $(wildcard include/config/inline/write/unlock/irqrestore.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/atomic.h \
    $(wildcard include/config/generic/atomic64.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/atomic.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/atomic_ll_sc.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/cmpxchg.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/atomic-long.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/math64.h \
    $(wildcard include/config/arch/supports/int128.h) \
  arch/arm64/include/generated/asm/div64.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/div64.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/time64.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/time.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/uidgid.h \
    $(wildcard include/config/multiuser.h) \
    $(wildcard include/config/user/ns.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/highuid.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/kmod.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/umh.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/gfp.h \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/zone/device.h) \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/pm/sleep.h) \
    $(wildcard include/config/memory/isolation.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/cma.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/zsmalloc.h) \
    $(wildcard include/config/memcg.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/page/extension.h) \
    $(wildcard include/config/no/bootmem.h) \
    $(wildcard include/config/numa/balancing.h) \
    $(wildcard include/config/deferred/struct/page/init.h) \
    $(wildcard include/config/transparent/hugepage.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/need/node/memmap/size.h) \
    $(wildcard include/config/have/memblock/node/map.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/memory/hotremove.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
    $(wildcard include/config/holes/in/zone.h) \
    $(wildcard include/config/arch/has/holes/memorymodel.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/wait.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/wait.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/nodemask.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/bitmap.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/page-flags-layout.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/generated/bounds.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/sparsemem.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/page.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/personality.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/personality.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/pgtable-types.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/pgtable-nopud.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/pgtable-nop4d-hack.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/5level-fixup.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/getorder.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/memory_hotplug.h \
    $(wildcard include/config/arch/has/add/pages.h) \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/have/bootmem/info/node.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/notifier.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/errno.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/errno.h \
  arch/arm64/include/generated/uapi/asm/errno.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/asm-generic/errno.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/asm-generic/errno-base.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/mutex.h \
    $(wildcard include/config/mutex/spin/on/owner.h) \
    $(wildcard include/config/debug/mutexes.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/osq_lock.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/debug_locks.h \
    $(wildcard include/config/debug/locking/api/selftests.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/spin/on/owner.h) \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/err.h \
  arch/arm64/include/generated/asm/rwsem.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/rwsem.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/srcu.h \
    $(wildcard include/config/tiny/srcu.h) \
    $(wildcard include/config/tree/srcu.h) \
    $(wildcard include/config/srcu.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/rcupdate.h \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/rcu/stall/common.h) \
    $(wildcard include/config/no/hz/full.h) \
    $(wildcard include/config/rcu/nocb/cpu.h) \
    $(wildcard include/config/tasks/rcu.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/prove/rcu.h) \
    $(wildcard include/config/rcu/boost.h) \
    $(wildcard include/config/arch/weak/release/acquire.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/rcutree.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/freezer.h) \
    $(wildcard include/config/wq/watchdog.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/timer.h \
    $(wildcard include/config/debug/objects/timers.h) \
    $(wildcard include/config/no/hz/common.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/ktime.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/jiffies.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/timex.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/timex.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/param.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/uapi/asm/param.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/asm-generic/param.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/timex.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/arch_timer.h \
    $(wildcard include/config/arm/arch/timer/ool/workaround.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/smp.h \
    $(wildcard include/config/up/late/init.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/llist.h \
    $(wildcard include/config/arch/have/nmi/safe/cmpxchg.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/smp.h \
    $(wildcard include/config/arm64/acpi/parking/protocol.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/percpu.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/percpu.h \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/clocksource/arm_arch_timer.h \
    $(wildcard include/config/arm/arch/timer.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/timecounter.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/timex.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/generated/timeconst.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/timekeeping.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/rcu_segcblist.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/srcutree.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/rcu_node_tree.h \
    $(wildcard include/config/rcu/fanout.h) \
    $(wildcard include/config/rcu/fanout/leaf.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/completion.h \
    $(wildcard include/config/lockdep/completions.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/mmzone.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/numa.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/topology.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/topology.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/topology.h \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
    $(wildcard include/config/sched/smt.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/sysctl.h \
    $(wildcard include/config/sysctl.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/rbtree.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/sysctl.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/elf.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/elf.h \
  arch/arm64/include/generated/asm/user.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/user.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/elf.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/elf-em.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/kobject.h \
    $(wildcard include/config/uevent/helper.h) \
    $(wildcard include/config/debug/kobject/release.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/sysfs.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/kernfs.h \
    $(wildcard include/config/kernfs.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/idr.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/radix-tree.h \
    $(wildcard include/config/radix/tree/multiorder.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/kobject_ns.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/kref.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/refcount.h \
    $(wildcard include/config/refcount/full.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/moduleparam.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/ppc64.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/rbtree_latch.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/module.h \
    $(wildcard include/config/arm64/module/plts.h) \
    $(wildcard include/config/dynamic/ftrace.h) \
    $(wildcard include/config/randomize/base.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/module.h \
    $(wildcard include/config/have/mod/arch/specific.h) \
    $(wildcard include/config/modules/use/elf/rel.h) \
    $(wildcard include/config/modules/use/elf/rela.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/vermagic.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/generated/utsrelease.h \

/root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/build/lib/librte_eal/linuxapp/kni/rte_kni.mod.o: $(deps_/root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/build/lib/librte_eal/linuxapp/kni/rte_kni.mod.o)

$(deps_/root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/build/lib/librte_eal/linuxapp/kni/rte_kni.mod.o):
