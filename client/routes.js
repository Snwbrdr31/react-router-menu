import React from 'react';
import { Route, IndexRoute } from 'react-router';
import App from './containers/App';
import NoMatch from './components/NoMatch';
import AboutUs from './components/AboutUs';
import Menus from './components/Menus';
import ContactUs from './components/ContactUs';
import Menu from './components/Menu';

export default (
  <Route>
    <Route path="/" component={App}>
      <IndexRoute component={AboutUs} />
      <Route path='/about_us' component={AboutUs} />
      <Route path='/menus' component={Menus} />
      <Route path='/contact_us' component={ContactUs} />
      <Route path='/menus/:id' component={Menu} />
    </Route>
    <Route path="*" status={404} component={NoMatch}/>
  </Route>
)
