import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const initializeFlatPickr = document.querySelector(".init-flat-pickr")
  if (initializeFlatPickr) {
    const dates = document.querySelector('#booking-form').dataset.dates
    const data = JSON.parse(dates)

    flatpickr(".datepicker", {
      disable: data,
    });
  }

}

export { initFlatpickr };
