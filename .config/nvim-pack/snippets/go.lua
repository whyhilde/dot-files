return {
  {
    prefix = "ctxb",
    body = "ctx := context.Background()",
  },
  {
    prefix = "ctxbc",
    body = {
      "ctx, cancel := context.WithCancel(context.Background())",
      "defer cancel()",
    },
  },
  {
    prefix = "trun",
    body = {
      "t.Run(${1:test case}, func(t *testing.T) {",
      "$0",
      "})",
    },
  },
  {
    prefix = "reqne",
    body = "require.NoError(t, ${0:gotErr})",
  },
  {
    prefix = "reqei",
    body = "require.ErrorIs(t, ${1:want}, ${0:got})",
  },
  {
    prefix = "test",
    body = {
      "func Test${1:name}(t *testing.T) {",
      "$0",
      "}",
    },
  },
}
