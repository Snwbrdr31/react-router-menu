import React from 'react';
import MenuJumbotron from './MenuJumbotron';

class Menus extends React.Component {
  state = { menus: [] };

  componentDidMount () {
    $.ajax({
      url: '/api/menus',
      type: 'GET',
      dataType: 'JSON',
    }).done( menus => {
      this.setState({ menus });
    }).fail( data => {
      console.log(data);
    });
  }

  deleteMenu = (id) => {
    $.ajax({
      url: `/api/menus/${id}`,
      type: 'DELETE',
      dataType: 'JSON'
    }).done( data => {
      let menus = this.state.menus.filter( menu => { return menu.id !== id });
      this.setState({ menus });
    }).fail( data => {
      console.log(data);
    })
  }

  displayMenus = () => {
    return this.state.menus.map( menu => {
      return(<MenuJumbotron key={menu.id} menu={menu} deleteMenu={this.deleteMenu} />);
    });
  }

  addMenu = (e) => {
    e.preventDefault();
    $.ajax({
      url: '/api/menus',
      type: 'POST',
      dataType: 'JSON',
      data: { menu: { name: this.refs.name.value }}
    }).done( menu => {
      this.setState({ menus: [...this.state.menus, menu] })
      this.refs.addForm.reset();
    }).fail( data => {
      console.log(data);
    });
  }


  render() {
    return(
      <div>
        <h3>Pizza && Beers Menu</h3>
        <form ref='addForm' onSubmit={this.addMenu}>
          <input type='text' required placeholder='Menu Name' ref='name' />
          <input type='submit' className='btn btn-primary' value='Add Menu'/>
        </form>
        { this.displayMenus() }
      </div>
    );
  }
}

export default Menus;
