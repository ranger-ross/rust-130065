#[test]
fn should_ok() {
    use feature_str_from_raw_parts_util::str_from_raw_parts;

    let x = unsafe { str_from_raw_parts("foobar".as_ptr(), 3) };
    let _ = x;
}
