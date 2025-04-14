import ReactOnRails from "react-on-rails";

import MainApp from "../bundles/MainApp/components/MainAppServer";

// This is how react_on_rails can see the MainApp in the browser.
ReactOnRails.register({
  MainApp,
});
