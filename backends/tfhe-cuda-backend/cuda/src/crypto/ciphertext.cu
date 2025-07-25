#include "ciphertext.cuh"
#include "polynomial/parameters.cuh"

void cuda_convert_lwe_ciphertext_vector_to_gpu_64(void *stream,
                                                  uint32_t gpu_index,
                                                  void *dest, void *src,
                                                  uint32_t number_of_cts,
                                                  uint32_t lwe_dimension) {
  cuda_convert_lwe_ciphertext_vector_to_gpu<uint64_t>(
      static_cast<cudaStream_t>(stream), gpu_index, (uint64_t *)dest,
      (uint64_t *)src, number_of_cts, lwe_dimension);
}

void cuda_convert_lwe_ciphertext_vector_to_cpu_64(void *stream,
                                                  uint32_t gpu_index,
                                                  void *dest, void *src,
                                                  uint32_t number_of_cts,
                                                  uint32_t lwe_dimension) {
  cuda_convert_lwe_ciphertext_vector_to_cpu<uint64_t>(
      static_cast<cudaStream_t>(stream), gpu_index, (uint64_t *)dest,
      (uint64_t *)src, number_of_cts, lwe_dimension);
}

void cuda_glwe_sample_extract_64(void *stream, uint32_t gpu_index,
                                 void *lwe_array_out, void const *glwe_array_in,
                                 uint32_t const *nth_array, uint32_t num_nths,
                                 uint32_t lwe_per_glwe, uint32_t glwe_dimension,
                                 uint32_t polynomial_size) {

  switch (polynomial_size) {
  case 256:
    host_sample_extract<uint64_t, AmortizedDegree<256>>(
        static_cast<cudaStream_t>(stream), gpu_index, (uint64_t *)lwe_array_out,
        (uint64_t const *)glwe_array_in, (uint32_t const *)nth_array, num_nths,
        lwe_per_glwe, glwe_dimension);
    break;
  case 512:
    host_sample_extract<uint64_t, AmortizedDegree<512>>(
        static_cast<cudaStream_t>(stream), gpu_index, (uint64_t *)lwe_array_out,
        (uint64_t const *)glwe_array_in, (uint32_t const *)nth_array, num_nths,
        lwe_per_glwe, glwe_dimension);
    break;
  case 1024:
    host_sample_extract<uint64_t, AmortizedDegree<1024>>(
        static_cast<cudaStream_t>(stream), gpu_index, (uint64_t *)lwe_array_out,
        (uint64_t const *)glwe_array_in, (uint32_t const *)nth_array, num_nths,
        lwe_per_glwe, glwe_dimension);
    break;
  case 2048:
    host_sample_extract<uint64_t, AmortizedDegree<2048>>(
        static_cast<cudaStream_t>(stream), gpu_index, (uint64_t *)lwe_array_out,
        (uint64_t const *)glwe_array_in, (uint32_t const *)nth_array, num_nths,
        lwe_per_glwe, glwe_dimension);
    break;
  case 4096:
    host_sample_extract<uint64_t, AmortizedDegree<4096>>(
        static_cast<cudaStream_t>(stream), gpu_index, (uint64_t *)lwe_array_out,
        (uint64_t const *)glwe_array_in, (uint32_t const *)nth_array, num_nths,
        lwe_per_glwe, glwe_dimension);
    break;
  case 8192:
    host_sample_extract<uint64_t, AmortizedDegree<8192>>(
        static_cast<cudaStream_t>(stream), gpu_index, (uint64_t *)lwe_array_out,
        (uint64_t const *)glwe_array_in, (uint32_t const *)nth_array, num_nths,
        lwe_per_glwe, glwe_dimension);
    break;
  case 16384:
    host_sample_extract<uint64_t, AmortizedDegree<16384>>(
        static_cast<cudaStream_t>(stream), gpu_index, (uint64_t *)lwe_array_out,
        (uint64_t const *)glwe_array_in, (uint32_t const *)nth_array, num_nths,
        lwe_per_glwe, glwe_dimension);
    break;
  default:
    PANIC("Cuda error: unsupported polynomial size. Supported "
          "N's are powers of two in the interval [256..16384].")
  }
}

void cuda_modulus_switch_inplace_64(void *stream, uint32_t gpu_index,
                                    void *lwe_array_out, uint32_t size,
                                    uint32_t log_modulus) {
  host_modulus_switch_inplace<uint64_t>(
      static_cast<cudaStream_t>(stream), gpu_index,
      static_cast<uint64_t *>(lwe_array_out), size, log_modulus);
}

// This end point is used only for testing purposes
// its output always follows trivial ordering
void cuda_improve_noise_modulus_switch_64(
    void *stream, uint32_t gpu_index, void *lwe_array_out,
    void const *lwe_array_in, void const *lwe_array_indexes,
    void const *encrypted_zeros, uint32_t lwe_size, uint32_t num_lwes,
    uint32_t num_zeros, double input_variance, double r_sigma, double bound,
    uint32_t log_modulus) {
  host_improve_noise_modulus_switch<uint64_t>(
      static_cast<cudaStream_t>(stream), gpu_index,
      static_cast<uint64_t *>(lwe_array_out),
      static_cast<uint64_t const *>(lwe_array_in),
      static_cast<uint64_t const *>(lwe_array_indexes),
      static_cast<const uint64_t *>(encrypted_zeros), lwe_size, num_lwes,
      num_zeros, input_variance, r_sigma, bound, log_modulus);
}

void cuda_glwe_sample_extract_128(
    void *stream, uint32_t gpu_index, void *lwe_array_out,
    void const *glwe_array_in, uint32_t const *nth_array, uint32_t num_nths,
    uint32_t lwe_per_glwe, uint32_t glwe_dimension, uint32_t polynomial_size) {

  switch (polynomial_size) {
  case 256:
    host_sample_extract<__uint128_t, AmortizedDegree<256>>(
        static_cast<cudaStream_t>(stream), gpu_index,
        (__uint128_t *)lwe_array_out, (__uint128_t const *)glwe_array_in,
        (uint32_t const *)nth_array, num_nths, lwe_per_glwe, glwe_dimension);
    break;
  case 512:
    host_sample_extract<__uint128_t, AmortizedDegree<512>>(
        static_cast<cudaStream_t>(stream), gpu_index,
        (__uint128_t *)lwe_array_out, (__uint128_t const *)glwe_array_in,
        (uint32_t const *)nth_array, num_nths, lwe_per_glwe, glwe_dimension);
    break;
  case 1024:
    host_sample_extract<__uint128_t, AmortizedDegree<1024>>(
        static_cast<cudaStream_t>(stream), gpu_index,
        (__uint128_t *)lwe_array_out, (__uint128_t const *)glwe_array_in,
        (uint32_t const *)nth_array, num_nths, lwe_per_glwe, glwe_dimension);
    break;
  case 2048:
    host_sample_extract<__uint128_t, AmortizedDegree<2048>>(
        static_cast<cudaStream_t>(stream), gpu_index,
        (__uint128_t *)lwe_array_out, (__uint128_t const *)glwe_array_in,
        (uint32_t const *)nth_array, num_nths, lwe_per_glwe, glwe_dimension);
    break;
  case 4096:
    host_sample_extract<__uint128_t, AmortizedDegree<4096>>(
        static_cast<cudaStream_t>(stream), gpu_index,
        (__uint128_t *)lwe_array_out, (__uint128_t const *)glwe_array_in,
        (uint32_t const *)nth_array, num_nths, lwe_per_glwe, glwe_dimension);
    break;
  default:
    PANIC("Cuda error: unsupported polynomial size. Supported "
          "N's are powers of two in the interval [256..4096].")
  }
}
