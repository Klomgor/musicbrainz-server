// @flow strict

declare module 'cookie' {
  declare type CookeParseOptions = {
    +decode?: (string) => string,
  };

  declare type CookieSerializeOptions = {
    +domain?: string,
    +encode?: (string) => string,
    +expires?: Date,
    +httpOnly?: boolean,
    +maxAge?: number,
    +partitioned?: boolean,
    +path?: string,
    +priority?: 'low' | 'medium' | 'high',
    +sameSite?: boolean | 'lax' | 'none' | 'strict',
    +secure?: boolean,
  };

  declare module.exports: {
    parse: (
      str: string,
      options?: CookeParseOptions,
    ) => {[cookieName: string]: string, ...},
    serialize: (
      name: string,
      value: string,
      options?: CookieSerializeOptions,
    ) => string,
  };
}
