import flatpickr from "flatpickr";

const initFlatpickr = () => {

  const dates = document.querySelector('#booking-form').dataset.dates
  const data = JSON.parse(dates)

  flatpickr(".datepicker", {
    disable: data
  });
}

export { initFlatpickr };
