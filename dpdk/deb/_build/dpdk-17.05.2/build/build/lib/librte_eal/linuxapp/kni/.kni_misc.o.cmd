cmd_/root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/build/lib/librte_eal/linuxapp/kni/kni_misc.o := gcc -Wp,-MD,/root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/build/lib/librte_eal/linuxapp/kni/.kni_misc.o.d  -nostdinc -isystem /usr/lib/gcc/aarch64-linux-gnu/5/include -I/usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include -I./arch/arm64/include/generated  -I/usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include -I./include -I/usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/uapi -I./arch/arm64/include/generated/uapi -I/usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi -I./include/generated/uapi -include /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/kconfig.h  -I/root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/build/lib/librte_eal/linuxapp/kni -I/root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/build/lib/librte_eal/linuxapp/kni -D__KERNEL__ -mlittle-endian -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -fno-PIE -mgeneral-regs-only -DCONFIG_AS_LSE=1 -fno-asynchronous-unwind-tables -mpc-relative-literal-loads -mabi=lp64 -fno-delete-null-pointer-checks -O2 --param=allow-store-data-races=0 -DCC_HAVE_ASM_GOTO -Wframe-larger-than=2048 -fno-stack-protector -Wno-unused-but-set-variable -fno-omit-frame-pointer -fno-optimize-sibling-calls -fno-var-tracking-assignments -g -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init  -I/root/vpp/dpdk/deb/_build/dpdk-17.05.2/lib/librte_eal/linuxapp/kni --param max-inline-insns-single=50  -I/root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/include  -I/root/vpp/dpdk/deb/_build/dpdk-17.05.2/lib/librte_eal/linuxapp/kni/ethtool/ixgbe  -I/root/vpp/dpdk/deb/_build/dpdk-17.05.2/lib/librte_eal/linuxapp/kni/ethtool/igb -include /root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/include/rte_config.h -Wall -Werror -DUBUNTU_RELEASE_CODE=1604 -D"UBUNTU_KERNEL_CODE=UBUNTU_KERNEL_VERSION(4,14,11,1)"  -DMODULE -mcmodel=large  -DKBUILD_BASENAME='"kni_misc"'  -DKBUILD_MODNAME='"rte_kni"' -c -o /root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/build/lib/librte_eal/linuxapp/kni/kni_misc.o /root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/build/lib/librte_eal/linuxapp/kni/kni_misc.c

source_/root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/build/lib/librte_eal/linuxapp/kni/kni_misc.o := /root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/build/lib/librte_eal/linuxapp/kni/kni_misc.c

deps_/root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/build/lib/librte_eal/linuxapp/kni/kni_misc.o := \
  /root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/include/rte_config.h \
    $(wildcard include/config/h.h) \
  include/generated/uapi/linux/version.h \
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
    $(wildcard include/config/module/unload.h) \
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
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/miscdevice.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/major.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/device.h \
    $(wildcard include/config/debug/devres.h) \
    $(wildcard include/config/generic/msi/irq/domain.h) \
    $(wildcard include/config/pinctrl.h) \
    $(wildcard include/config/generic/msi/irq.h) \
    $(wildcard include/config/dma/cma.h) \
    $(wildcard include/config/of.h) \
    $(wildcard include/config/devtmpfs.h) \
    $(wildcard include/config/sysfs/deprecated.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/ioport.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/klist.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/pinctrl/devinfo.h \
    $(wildcard include/config/pm.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/pinctrl/consumer.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/seq_file.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/fs.h \
    $(wildcard include/config/fs/posix/acl.h) \
    $(wildcard include/config/security.h) \
    $(wildcard include/config/cgroup/writeback.h) \
    $(wildcard include/config/ima.h) \
    $(wildcard include/config/fsnotify.h) \
    $(wildcard include/config/fs/encryption.h) \
    $(wildcard include/config/epoll.h) \
    $(wildcard include/config/file/locking.h) \
    $(wildcard include/config/quota.h) \
    $(wildcard include/config/fs/dax.h) \
    $(wildcard include/config/mandatory/file/locking.h) \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/migration.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/wait_bit.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/kdev_t.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/kdev_t.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/dcache.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/rculist.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/rculist_bl.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/list_bl.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/bit_spinlock.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/lockref.h \
    $(wildcard include/config/arch/use/cmpxchg/lockref.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/stringhash.h \
    $(wildcard include/config/dcache/word/access.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/hash.h \
    $(wildcard include/config/have/arch/hash.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/path.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/list_lru.h \
    $(wildcard include/config/slob.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/shrinker.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/pid.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/mm_types.h \
    $(wildcard include/config/have/cmpxchg/double.h) \
    $(wildcard include/config/have/aligned/struct/page.h) \
    $(wildcard include/config/kmemcheck.h) \
    $(wildcard include/config/userfaultfd.h) \
    $(wildcard include/config/have/arch/compat/mmap/bases.h) \
    $(wildcard include/config/membarrier.h) \
    $(wildcard include/config/aio.h) \
    $(wildcard include/config/mmu/notifier.h) \
    $(wildcard include/config/arch/want/batched/unmap/tlb/flush.h) \
    $(wildcard include/config/hmm.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/mm_types_task.h \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/arch/enable/split/pmd/ptlock.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/auxvec.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/auxvec.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/uapi/asm/auxvec.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/uprobes.h \
    $(wildcard include/config/uprobes.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/mmu.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/capability.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/capability.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/semaphore.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/fcntl.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/fcntl.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/uapi/asm/fcntl.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/asm-generic/fcntl.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/fiemap.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/migrate_mode.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/percpu-rwsem.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/rcuwait.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/rcu_sync.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/delayed_call.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/uuid.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/uuid.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/errseq.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/fs.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/limits.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/ioctl.h \
  arch/arm64/include/generated/uapi/asm/ioctl.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/ioctl.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/asm-generic/ioctl.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/quota.h \
    $(wildcard include/config/quota/netlink/interface.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/percpu_counter.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/dqblk_xfs.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/dqblk_v1.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/dqblk_v2.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/dqblk_qtree.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/projid.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/quota.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/nfs_fs_i.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/cred.h \
    $(wildcard include/config/debug/credentials.h) \
    $(wildcard include/config/keys.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/key.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/assoc_array.h \
    $(wildcard include/config/associative/array.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/selinux.h \
    $(wildcard include/config/security/selinux.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/sched.h \
    $(wildcard include/config/virt/cpu/accounting/native.h) \
    $(wildcard include/config/sched/info.h) \
    $(wildcard include/config/schedstats.h) \
    $(wildcard include/config/fair/group/sched.h) \
    $(wildcard include/config/rt/group/sched.h) \
    $(wildcard include/config/cgroup/sched.h) \
    $(wildcard include/config/blk/dev/io/trace.h) \
    $(wildcard include/config/compat/brk.h) \
    $(wildcard include/config/cgroups.h) \
    $(wildcard include/config/cc/stackprotector.h) \
    $(wildcard include/config/arch/has/scaled/cputime.h) \
    $(wildcard include/config/virt/cpu/accounting/gen.h) \
    $(wildcard include/config/posix/timers.h) \
    $(wildcard include/config/sysvipc.h) \
    $(wildcard include/config/detect/hung/task.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/rt/mutexes.h) \
    $(wildcard include/config/ubsan.h) \
    $(wildcard include/config/task/xacct.h) \
    $(wildcard include/config/cpusets.h) \
    $(wildcard include/config/intel/rdt.h) \
    $(wildcard include/config/futex.h) \
    $(wildcard include/config/perf/events.h) \
    $(wildcard include/config/task/delay/acct.h) \
    $(wildcard include/config/fault/injection.h) \
    $(wildcard include/config/latencytop.h) \
    $(wildcard include/config/function/graph/tracer.h) \
    $(wildcard include/config/kcov.h) \
    $(wildcard include/config/bcache.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/sched.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/sem.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/sem.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/ipc.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/rhashtable.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/jhash.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/unaligned/packed_struct.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/list_nulls.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/ipc.h \
  arch/arm64/include/generated/uapi/asm/ipcbuf.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/asm-generic/ipcbuf.h \
  arch/arm64/include/generated/uapi/asm/sembuf.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/asm-generic/sembuf.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/shm.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/shm.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/asm-generic/hugetlb_encode.h \
  arch/arm64/include/generated/uapi/asm/shmbuf.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/asm-generic/shmbuf.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/shmparam.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/asm-generic/shmparam.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/kcov.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/kcov.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/plist.h \
    $(wildcard include/config/debug/pi/list.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/hrtimer.h \
    $(wildcard include/config/high/res/timers.h) \
    $(wildcard include/config/time/low/res.h) \
    $(wildcard include/config/timerfd.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/timerqueue.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/seccomp.h \
    $(wildcard include/config/seccomp.h) \
    $(wildcard include/config/have/arch/seccomp/filter.h) \
    $(wildcard include/config/seccomp/filter.h) \
    $(wildcard include/config/checkpoint/restore.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/seccomp.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/seccomp.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/unistd.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/uapi/asm/unistd.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/unistd.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/asm-generic/unistd.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/seccomp.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/unistd.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/resource.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/resource.h \
  arch/arm64/include/generated/uapi/asm/resource.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/resource.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/asm-generic/resource.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/latencytop.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/sched/prio.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/signal_types.h \
    $(wildcard include/config/old/sigaction.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/signal.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/uapi/asm/signal.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/signal.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/asm-generic/signal.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/asm-generic/signal-defs.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/uapi/asm/sigcontext.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/uapi/asm/siginfo.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/asm-generic/siginfo.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/task_io_accounting.h \
    $(wildcard include/config/task/io/accounting.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/sched/user.h \
    $(wildcard include/config/fanotify.h) \
    $(wildcard include/config/posix/mqueue.h) \
    $(wildcard include/config/bpf/syscall.h) \
    $(wildcard include/config/net.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/pinctrl/pinctrl-state.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/pm.h \
    $(wildcard include/config/vt/console/sleep.h) \
    $(wildcard include/config/pm/clk.h) \
    $(wildcard include/config/pm/generic/domains.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/ratelimit.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/device.h \
    $(wildcard include/config/iommu/api.h) \
    $(wildcard include/config/xen.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/pm_wakeup.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/netdevice.h \
    $(wildcard include/config/dcb.h) \
    $(wildcard include/config/hyperv/net.h) \
    $(wildcard include/config/wlan.h) \
    $(wildcard include/config/ax25.h) \
    $(wildcard include/config/mac80211/mesh.h) \
    $(wildcard include/config/net/ipip.h) \
    $(wildcard include/config/net/ipgre.h) \
    $(wildcard include/config/ipv6/sit.h) \
    $(wildcard include/config/ipv6/tunnel.h) \
    $(wildcard include/config/rps.h) \
    $(wildcard include/config/netpoll.h) \
    $(wildcard include/config/xps.h) \
    $(wildcard include/config/bql.h) \
    $(wildcard include/config/rfs/accel.h) \
    $(wildcard include/config/fcoe.h) \
    $(wildcard include/config/xfrm/offload.h) \
    $(wildcard include/config/net/poll/controller.h) \
    $(wildcard include/config/libfcoe.h) \
    $(wildcard include/config/wireless/ext.h) \
    $(wildcard include/config/net/switchdev.h) \
    $(wildcard include/config/net/l3/master/dev.h) \
    $(wildcard include/config/ipv6.h) \
    $(wildcard include/config/xfrm.h) \
    $(wildcard include/config/vlan/8021q.h) \
    $(wildcard include/config/net/dsa.h) \
    $(wildcard include/config/tipc.h) \
    $(wildcard include/config/mpls/routing.h) \
    $(wildcard include/config/net/cls/act.h) \
    $(wildcard include/config/netfilter/ingress.h) \
    $(wildcard include/config/net/sched.h) \
    $(wildcard include/config/garp.h) \
    $(wildcard include/config/mrp.h) \
    $(wildcard include/config/cgroup/net/prio.h) \
    $(wildcard include/config/net/flow/limit.h) \
    $(wildcard include/config/proc/fs.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/delay.h \
  arch/arm64/include/generated/asm/delay.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/delay.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/prefetch.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/dynamic_queue_limits.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/ethtool.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/compat.h \
    $(wildcard include/config/compat/old/sigaction.h) \
    $(wildcard include/config/odd/rt/sigaction.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/ethtool.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/if_ether.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/skbuff.h \
    $(wildcard include/config/nf/conntrack.h) \
    $(wildcard include/config/bridge/netfilter.h) \
    $(wildcard include/config/ipv6/ndisc/nodetype.h) \
    $(wildcard include/config/net/rx/busy/poll.h) \
    $(wildcard include/config/network/secmark.h) \
    $(wildcard include/config/network/phy/timestamping.h) \
    $(wildcard include/config/netfilter/xt/target/trace.h) \
    $(wildcard include/config/nf/tables.h) \
    $(wildcard include/config/ip/vs.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/kmemcheck.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/socket.h \
  arch/arm64/include/generated/uapi/asm/socket.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/asm-generic/socket.h \
  arch/arm64/include/generated/uapi/asm/sockios.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/asm-generic/sockios.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/sockios.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/uio.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/uio.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/socket.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/net.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/random.h \
    $(wildcard include/config/gcc/plugin/latent/entropy.h) \
    $(wildcard include/config/arch/random.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/once.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/random.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/irqnr.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/irqnr.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/net.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/textsearch.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/slab.h \
    $(wildcard include/config/debug/slab.h) \
    $(wildcard include/config/failslab.h) \
    $(wildcard include/config/have/hardened/usercopy/allocator.h) \
    $(wildcard include/config/slab.h) \
    $(wildcard include/config/slub.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/kmemleak.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/vmalloc.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/kasan.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/checksum.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/uaccess.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/kasan-checks.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/uaccess.h \
    $(wildcard include/config/arm64/pan.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/kernel-pgtable.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/pgtable.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/proc-fns.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/pgtable-prot.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/fixmap.h \
    $(wildcard include/config/acpi/apei/ghes.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/boot.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/fixmap.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/pgtable.h \
    $(wildcard include/config/have/arch/transparent/hugepage/pud.h) \
    $(wildcard include/config/have/arch/soft/dirty.h) \
    $(wildcard include/config/arch/enable/thp/migration.h) \
    $(wildcard include/config/have/arch/huge/vmap.h) \
    $(wildcard include/config/x86/espfix64.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/compiler.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/extable.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/checksum.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/checksum.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/dma-mapping.h \
    $(wildcard include/config/have/generic/dma/coherent.h) \
    $(wildcard include/config/has/dma.h) \
    $(wildcard include/config/arch/has/dma/set/coherent/mask.h) \
    $(wildcard include/config/need/dma/map/state.h) \
    $(wildcard include/config/dma/api/debug.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/dma-debug.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/dma-direction.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/scatterlist.h \
    $(wildcard include/config/debug/sg.h) \
    $(wildcard include/config/need/sg/dma/length.h) \
    $(wildcard include/config/arch/has/sg/chain.h) \
    $(wildcard include/config/sg/pool.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/mm.h \
    $(wildcard include/config/have/arch/mmap/rnd/bits.h) \
    $(wildcard include/config/have/arch/mmap/rnd/compat/bits.h) \
    $(wildcard include/config/mem/soft/dirty.h) \
    $(wildcard include/config/arch/uses/high/vma/flags.h) \
    $(wildcard include/config/x86.h) \
    $(wildcard include/config/x86/intel/memory/protection/keys.h) \
    $(wildcard include/config/ppc.h) \
    $(wildcard include/config/parisc.h) \
    $(wildcard include/config/metag.h) \
    $(wildcard include/config/x86/intel/mpx.h) \
    $(wildcard include/config/stack/growsup.h) \
    $(wildcard include/config/device/private.h) \
    $(wildcard include/config/device/public.h) \
    $(wildcard include/config/shmem.h) \
    $(wildcard include/config/debug/vm/rb.h) \
    $(wildcard include/config/page/poisoning.h) \
    $(wildcard include/config/debug/pagealloc.h) \
    $(wildcard include/config/hibernation.h) \
    $(wildcard include/config/hugetlbfs.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/range.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/percpu-refcount.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/page_ext.h \
    $(wildcard include/config/idle/page/tracking.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/stacktrace.h \
    $(wildcard include/config/stacktrace.h) \
    $(wildcard include/config/user/stacktrace/support.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/stackdepot.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/page_ref.h \
    $(wildcard include/config/debug/page/ref.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/page-flags.h \
    $(wildcard include/config/arch/uses/pg/uncached.h) \
    $(wildcard include/config/memory/failure.h) \
    $(wildcard include/config/swap.h) \
    $(wildcard include/config/thp/swap.h) \
    $(wildcard include/config/ksm.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/tracepoint-defs.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/static_key.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/memremap.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/huge_mm.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/sched/coredump.h \
    $(wildcard include/config/core/dump/default/elf/headers.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/vmstat.h \
    $(wildcard include/config/vm/event/counters.h) \
    $(wildcard include/config/debug/tlbflush.h) \
    $(wildcard include/config/debug/vm/vmacache.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/vm_event_item.h \
    $(wildcard include/config/memory/balloon.h) \
    $(wildcard include/config/balloon/compaction.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/io.h \
  arch/arm64/include/generated/asm/early_ioremap.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/early_ioremap.h \
    $(wildcard include/config/generic/early/ioremap.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/xen/xen.h \
    $(wildcard include/config/xen/pvh.h) \
    $(wildcard include/config/xen/dom0.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/xen/interface/xen.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/xen/interface.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/xen/arm/interface.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/xen/hypervisor.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/xen/arm/hypervisor.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/io.h \
    $(wildcard include/config/generic/iomap.h) \
    $(wildcard include/config/has/ioport/map.h) \
    $(wildcard include/config/virt/to/bus.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/pci_iomap.h \
    $(wildcard include/config/pci.h) \
    $(wildcard include/config/no/generic/pci/ioport/map.h) \
    $(wildcard include/config/generic/pci/iomap.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/mem_encrypt.h \
    $(wildcard include/config/arch/has/mem/encrypt.h) \
    $(wildcard include/config/amd/mem/encrypt.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/dma-mapping.h \
    $(wildcard include/config/iommu/dma.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/netdev_features.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/sched/clock.h \
    $(wildcard include/config/have/unstable/sched/clock.h) \
    $(wildcard include/config/irq/time/accounting.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/flow_dissector.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/in6.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/in6.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/libc-compat.h \
    $(wildcard include/config/data.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/if_ether.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/splice.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/pipe_fs_i.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/if_packet.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/flow.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/net_namespace.h \
    $(wildcard include/config/ieee802154/6lowpan.h) \
    $(wildcard include/config/ip/sctp.h) \
    $(wildcard include/config/ip/dccp.h) \
    $(wildcard include/config/netfilter.h) \
    $(wildcard include/config/nf/defrag/ipv6.h) \
    $(wildcard include/config/netfilter/netlink/acct.h) \
    $(wildcard include/config/nf/ct/netlink/timeout.h) \
    $(wildcard include/config/wext/core.h) \
    $(wildcard include/config/mpls.h) \
    $(wildcard include/config/can.h) \
    $(wildcard include/config/net/ns.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/netns/core.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/netns/mib.h \
    $(wildcard include/config/xfrm/statistics.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/snmp.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/snmp.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/u64_stats_sync.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/netns/unix.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/netns/packet.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/netns/ipv4.h \
    $(wildcard include/config/ip/multiple/tables.h) \
    $(wildcard include/config/ip/route/classid.h) \
    $(wildcard include/config/ip/mroute.h) \
    $(wildcard include/config/ip/mroute/multiple/tables.h) \
    $(wildcard include/config/ip/route/multipath.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/inet_frag.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/netns/ipv6.h \
    $(wildcard include/config/ipv6/multiple/tables.h) \
    $(wildcard include/config/ipv6/mroute.h) \
    $(wildcard include/config/ipv6/mroute/multiple/tables.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/dst_ops.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/netns/ieee802154_6lowpan.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/netns/sctp.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/netns/dccp.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/netns/netfilter.h \
    $(wildcard include/config/nf/defrag/ipv4.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/netfilter_defs.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/netfilter.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/in.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/in.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/netns/x_tables.h \
    $(wildcard include/config/bridge/nf/ebtables.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/netns/conntrack.h \
    $(wildcard include/config/nf/ct/proto/dccp.h) \
    $(wildcard include/config/nf/ct/proto/sctp.h) \
    $(wildcard include/config/nf/conntrack/events.h) \
    $(wildcard include/config/nf/conntrack/labels.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/netfilter/nf_conntrack_tcp.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/netfilter/nf_conntrack_tcp.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/netns/nftables.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/netns/xfrm.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/xfrm.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/netns/mpls.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/netns/can.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/ns_common.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/seq_file_net.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/netprio_cgroup.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/cgroup.h \
    $(wildcard include/config/sock/cgroup/data.h) \
    $(wildcard include/config/cgroup/net/classid.h) \
    $(wildcard include/config/cgroup/data.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/cgroupstats.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/taskstats.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/nsproxy.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/user_namespace.h \
    $(wildcard include/config/inotify/user.h) \
    $(wildcard include/config/persistent/keyrings.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/cgroup-defs.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/bpf-cgroup.h \
    $(wildcard include/config/cgroup/bpf.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/bpf.h \
    $(wildcard include/config/efficient/unaligned/access.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/bpf_common.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/cgroup_subsys.h \
    $(wildcard include/config/cgroup/cpuacct.h) \
    $(wildcard include/config/blk/cgroup.h) \
    $(wildcard include/config/cgroup/device.h) \
    $(wildcard include/config/cgroup/freezer.h) \
    $(wildcard include/config/cgroup/perf.h) \
    $(wildcard include/config/cgroup/hugetlb.h) \
    $(wildcard include/config/cgroup/pids.h) \
    $(wildcard include/config/cgroup/rdma.h) \
    $(wildcard include/config/cgroup/debug.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/hardirq.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/ftrace_irq.h \
    $(wildcard include/config/ftrace/nmi/enter.h) \
    $(wildcard include/config/hwlat/tracer.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/vtime.h \
    $(wildcard include/config/virt/cpu/accounting.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/context_tracking_state.h \
    $(wildcard include/config/context/tracking.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/hardirq.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/irq.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/irq.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/irq_cpustat.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/neighbour.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/netlink.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/scm.h \
    $(wildcard include/config/security/network.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/security.h \
    $(wildcard include/config/security/infiniband.h) \
    $(wildcard include/config/security/network/xfrm.h) \
    $(wildcard include/config/security/path.h) \
    $(wildcard include/config/audit.h) \
    $(wildcard include/config/securityfs.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/netlink.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/netdevice.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/if.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/hdlc/ioctl.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/if_link.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/if_link.h \
    $(wildcard include/config/pending.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/if_bonding.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/pkt_cls.h \
    $(wildcard include/config/net/cls/ind.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/pkt_sched.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/hashtable.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/etherdevice.h \
    $(wildcard include/config/have/efficient/unaligned/access.h) \
  arch/arm64/include/generated/asm/unaligned.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/asm-generic/unaligned.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/unaligned/access_ok.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/unaligned/generic.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/pci.h \
    $(wildcard include/config/pci/iov.h) \
    $(wildcard include/config/pcieaer.h) \
    $(wildcard include/config/pcieaspm.h) \
    $(wildcard include/config/pcie/ptm.h) \
    $(wildcard include/config/pci/msi.h) \
    $(wildcard include/config/pci/ats.h) \
    $(wildcard include/config/pci/pri.h) \
    $(wildcard include/config/pci/pasid.h) \
    $(wildcard include/config/pci/domains/generic.h) \
    $(wildcard include/config/pci/bus/addr/t/64bit.h) \
    $(wildcard include/config/pcieportbus.h) \
    $(wildcard include/config/pcie/ecrc.h) \
    $(wildcard include/config/ht/irq.h) \
    $(wildcard include/config/pci/domains.h) \
    $(wildcard include/config/acpi.h) \
    $(wildcard include/config/pci/quirks.h) \
    $(wildcard include/config/hibernate/callbacks.h) \
    $(wildcard include/config/pci/mmconfig.h) \
    $(wildcard include/config/acpi/mcfg.h) \
    $(wildcard include/config/hotplug/pci.h) \
    $(wildcard include/config/eeh.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/mod_devicetable.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/interrupt.h \
    $(wildcard include/config/irq/forced/threading.h) \
    $(wildcard include/config/generic/irq/probe.h) \
    $(wildcard include/config/irq/timings.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/irqreturn.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/io.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/resource_ext.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/pci.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/uapi/linux/pci_regs.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/pci_ids.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/pci-dma.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/dmapool.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/arch/arm64/include/asm/pci.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/pci-dma-compat.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/kthread.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/net/netns/generic.h \
  /root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/include/exec-env/rte_kni_common.h \
  /root/vpp/dpdk/deb/_build/dpdk-17.05.2/lib/librte_eal/linuxapp/kni/compat.h \
  /root/vpp/dpdk/deb/_build/dpdk-17.05.2/lib/librte_eal/linuxapp/kni/kni_dev.h \
  /root/vpp/dpdk/deb/_build/dpdk-17.05.2/lib/librte_eal/linuxapp/kni/compat.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/sched/signal.h \
    $(wildcard include/config/sched/autogroup.h) \
    $(wildcard include/config/bsd/process/acct.h) \
    $(wildcard include/config/taskstats.h) \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/signal.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/sched/jobctl.h \
  /usr/local/Cavium_Networks/OCTEONTX-SDK-k414/linux/kernel/linux-4.14.11/include/linux/sched/task.h \
    $(wildcard include/config/have/copy/thread/tls.h) \
    $(wildcard include/config/have/exit/thread.h) \
    $(wildcard include/config/arch/wants/dynamic/task/struct.h) \

/root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/build/lib/librte_eal/linuxapp/kni/kni_misc.o: $(deps_/root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/build/lib/librte_eal/linuxapp/kni/kni_misc.o)

$(deps_/root/vpp/dpdk/deb/_build/dpdk-17.05.2/build/build/lib/librte_eal/linuxapp/kni/kni_misc.o):
