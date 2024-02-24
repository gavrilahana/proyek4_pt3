// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'designer.dart';

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    const allProducts = <Product>[
      Product(
        category: Category.designer,
        id: 0,
        name: 'Steve',
        rate: '5/5',
      ),
      Product(
        category: Category.designer,
        id: 1,
        name: 'Steve',
        rate: '5/5',
      ),
      Product(
        category: Category.designer,
        id: 3,
        name: 'Steve',
        rate: '5/5',
      ),
      Product(
        category: Category.designer,
        id: 4,
        name: 'Steve',
        rate: '5/5',
      ),
    ];
    return allProducts;
    }
}
