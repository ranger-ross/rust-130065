#![feature(str_from_raw_parts)]

// foo
use core::str::from_raw_parts;

/// # Safety
///
/// TODO
#[inline]
#[must_use]
pub const unsafe fn str_from_raw_parts<'a>(ptr: *const u8, len: usize) -> &'a str {
    from_raw_parts(ptr, len)
}

