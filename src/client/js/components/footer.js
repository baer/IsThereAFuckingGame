import React from "react";

const Footer = () => {
  return (
    <footer>
      <span className="personal-links">
        This site is an <a href="https://github.com/baer/isThereAFuckingGame">open source project</a> created and maintained by <a href="http://www.linkedin.com/pub/eric-baer/8/3bb/50/">Eric Baer</a>
      </span>
      <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
        <input type="hidden" name="cmd" value="_s-xclick"/>
        <input type="hidden" name="encrypted" value="-----BEGIN PKCS7-----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-----END PKCS7-----
          "
        />

        <button type="submit" name="submit" className="btn btn-beer" alt="Thanks a fucking bunch">
          <i className="fa fa-beer"/>
          Buy Me A Beer
        </button>
      </form>
    </footer>
  );
};

export {
  Footer
};
