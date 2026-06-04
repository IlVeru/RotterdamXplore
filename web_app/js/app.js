/**
 * ============================================================================
 * ROTTERDAMXPLORE — INTERACTIVE PORTAL APP CONTROLLER
 * ============================================================================
 */

document.addEventListener('DOMContentLoaded', () => {
  // Scroll to top and initialize default price calculation
  window.scrollTo(0, 0);
  calculateTotalPrice();
  
  // Back key / Close lightbox on Escape press
  document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape') {
      closeLightbox();
    }
  });

  // Close lightbox on backdrop click
  const lightbox = document.getElementById('lightbox');
  if (lightbox) {
    lightbox.addEventListener('click', (e) => {
      if (e.target === lightbox) {
        closeLightbox();
      }
    });
  }
});

/**
 * ========== SECTION CONTROLLER (SPA) ==========
 * Handles tab navigation, highlights visual focus, and smooth viewport resets
 */
function showPage(pageId) {
  // 1. Get all page sections
  const sections = document.querySelectorAll('.page-section');
  sections.forEach(section => {
    section.classList.remove('active');
  });

  // 2. Show selected page section
  const targetSection = document.getElementById(pageId);
  if (targetSection) {
    targetSection.classList.add('active');
  }

  // 3. Update active state on Navigation items
  const navLinks = document.querySelectorAll('.nav-links a');
  navLinks.forEach(link => {
    link.classList.remove('active');
    
    // Check match based on onclick attribute or ID
    if (link.getAttribute('onclick').includes(pageId)) {
      link.classList.add('active');
    }
  });

  // 4. Smooth scroll window back to top
  window.scrollTo({
    top: 0,
    behavior: 'smooth'
  });
}

/**
 * ========== GALLERY FILTERS & TRANSITIONS ==========
 * Filters masonry gallery elements with smooth opacity & scale effects
 */
function filterGallery(category) {
  // Update active status on filter buttons
  const filterBtns = document.querySelectorAll('.filter-btn');
  filterBtns.forEach(btn => {
    btn.classList.remove('active');
    
    // Set active button
    if (btn.getAttribute('onclick').includes(category)) {
      btn.classList.add('active');
    }
  });

  const galleryItems = document.querySelectorAll('.gallery-item');
  
  galleryItems.forEach(item => {
    const itemCategory = item.getAttribute('data-category');
    
    if (category === 'all' || itemCategory === category) {
      // Show matching item
      item.style.display = 'block';
      setTimeout(() => {
        item.style.opacity = '1';
        item.style.transform = 'scale(1)';
      }, 50);
    } else {
      // Hide non-matching item
      item.style.opacity = '0';
      item.style.transform = 'scale(0.95)';
      setTimeout(() => {
        item.style.display = 'none';
      }, 300);
    }
  });
}

/**
 * ========== IMAGERY LIGHTBOX ==========
 * Toggles higher resolution overlay view with smooth focus
 */
function openLightbox(imgSrc, captionText) {
  const lightbox = document.getElementById('lightbox');
  const lightboxImg = document.getElementById('lightbox-img');
  const lightboxCaption = document.getElementById('lightbox-caption');

  if (lightbox && lightboxImg && lightboxCaption) {
    lightboxImg.src = imgSrc;
    lightboxCaption.textContent = captionText;
    lightbox.classList.add('open');
    
    // Disable background page scroll
    document.body.style.overflow = 'hidden';
  }
}

function closeLightbox() {
  const lightbox = document.getElementById('lightbox');
  if (lightbox) {
    lightbox.classList.remove('open');
    
    // Re-enable page scroll
    document.body.style.overflow = 'auto';
  }
}

/**
 * ========== TICKET PRICE CALCULATOR ==========
 * Computes ticket pricing in IDR and applies group volume discounts (20% for 20+ tickets)
 */
function calculateTotalPrice() {
  const categorySelect = document.getElementById('booking-category');
  const quantityInput = document.getElementById('booking-quantity');
  
  if (!categorySelect || !quantityInput) return;

  const category = categorySelect.value;
  let quantity = parseInt(quantityInput.value);

  if (isNaN(quantity) || quantity < 1) {
    quantity = 1;
  }

  // Price matrix based on categories
  const priceList = {
    adult: 10000,
    student: 5000,
    child: 2000,
    foreign: 25000
  };

  const unitPrice = priceList[category] || 10000;
  let totalPrice = unitPrice * quantity;
  let discount = 0;

  // Apply group discount: 20% discount if booking 20 or more tickets
  const discountRow = document.getElementById('discount-row');
  const discountLabel = document.getElementById('summary-discount');
  
  if (quantity >= 20) {
    discount = totalPrice * 0.20;
    totalPrice = totalPrice - discount;
    
    if (discountRow && discountLabel) {
      discountRow.style.display = 'flex';
      discountLabel.textContent = '-Rp ' + formatRupiah(discount);
    }
  } else {
    if (discountRow) {
      discountRow.style.display = 'none';
    }
  }

  // Update DOM summaries
  document.getElementById('summary-unit-price').textContent = 'Rp ' + formatRupiah(unitPrice);
  document.getElementById('summary-qty').textContent = quantity + ' Tiket';
  document.getElementById('summary-total').textContent = 'Rp ' + formatRupiah(totalPrice);
}

// Utility function to format integer values as Indonesian Rupiah formats (e.g. 10.000)
function formatRupiah(number) {
  return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}

/**
 * ========== BOOKING FORM TRANSACTION MANAGER ==========
 * Toggles success states, validates fields, and manages ticket calculations
 */
function handleFormSubmit(event) {
  event.preventDefault();

  const name = document.getElementById('booking-name').value;
  const email = document.getElementById('booking-email').value;
  const date = document.getElementById('booking-date').value;
  
  if (!name || !email || !date) {
    alert('Harap lengkapi semua data formulir!');
    return;
  }

  // Simulation: Transition form display elements
  const bookingForm = document.getElementById('ticket-booking-form');
  const successState = document.getElementById('form-success-state');

  if (bookingForm && successState) {
    bookingForm.classList.add('hide');
    
    setTimeout(() => {
      successState.classList.add('show');
      
      // Scroll smoothly to form wrapper top so user sees the celebration
      const formWrapper = document.querySelector('.booking-form-wrapper');
      if (formWrapper) {
        formWrapper.scrollIntoView({
          behavior: 'smooth',
          block: 'center'
        });
      }
    }, 300);
  }
}

function resetBookingForm() {
  const bookingForm = document.getElementById('ticket-booking-form');
  const successState = document.getElementById('form-success-state');

  if (bookingForm && successState) {
    // Reset standard form inputs
    bookingForm.reset();
    
    // Hide success and display form
    successState.classList.remove('show');
    bookingForm.classList.remove('hide');
    
    // Recompute default price details
    calculateTotalPrice();
    
    // Scroll cleanly back to form
    const formWrapper = document.querySelector('.booking-form-wrapper');
    if (formWrapper) {
      formWrapper.scrollIntoView({
        behavior: 'smooth',
        block: 'center'
      });
    }
  }
}
