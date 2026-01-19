# Build Instructions

## Issue
The build is currently failing due to a Cargo version compatibility issue with the `blake3` dependency requiring `edition2024`, which isn't supported by the current Cargo version (1.84.0).

## Solutions

### Option 1: Update Rust/Cargo (Recommended)
```bash
rustup update stable
# Or install the latest nightly
rustup toolchain install nightly
rustup default nightly
```

Then try building again:
```bash
anchor build
```

### Option 2: Use Cargo build-sbf directly
If Anchor build continues to fail, you can try building directly:
```bash
cd programs/blueshift-anchor-escrow
cargo build-sbf
```

The `.so` file should be generated in `target/deploy/blueshift_anchor_escrow.so`

### Option 3: Manual workaround
If the above don't work, you may need to:
1. Update to the latest Rust nightly toolchain
2. Or wait for a Cargo update that supports edition2024

## Current Status
- ✅ Code compiles successfully (verified with `cargo check`)
- ✅ All challenge requirements met:
  - State account discriminator = 1
  - Make instruction discriminator = 0  
  - Take instruction discriminator = 1
  - Refund instruction discriminator = 2
- ⚠️ Build blocked by dependency version issue

## Program Structure
```
anchor-escrow/
├── Anchor.toml
├── programs/
│   └── blueshift-anchor-escrow/
│       ├── Cargo.toml
│       └── src/
│           ├── lib.rs
│           ├── state.rs
│           ├── errors.rs
│           └── instructions/
│               ├── make.rs
│               ├── take.rs
│               └── refund.rs
└── target/deploy/  (will contain .so file after successful build)
```
