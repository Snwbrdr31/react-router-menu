import React from 'react';
import Nav from '../components/Nav';

const App = ({ children }) => (
  <div>
    <Nav />
    <div className='container text-center'>
    { children }
    </div>
  </div>
)

export default App;
