#include "vec3.h"
#include "gtest/gtest.h"

namespace {

TEST(Vector3Test, VectorAddition) {

    vec3 v1(1, 2, 3);
    vec3 v2(4, 5, 6);

    vec3 result = v1 + v2;

    ASSERT_EQ(result[0], 5);
    ASSERT_EQ(result[1], 7);
    ASSERT_EQ(result[2], 9);

}



} // namespace

