import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('item_location');
  if (addressInput) {
    places({ container: addressInput });
  }

  const addressInputHome = document.getElementById('location-search-home');
  if (addressInputHome) {
    places({ container: addressInputHome });
  }
};

export { initAutocomplete };
