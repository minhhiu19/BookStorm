import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import categoryService from '../services/categoryService';
import styles from './Categories.module.css';

function Categories() {
  const [categories, setCategories] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchCategories = async () => {
      try {
        const res = await categoryService.getRootCategories();
        setCategories(res.data || []);
      } catch (err) {
        console.error('Failed to fetch categories:', err);
      } finally {
        setLoading(false);
      }
    };
    fetchCategories();
  }, []);

  return (
    <div className={styles.page}>
      <div className={styles.container}>
        <div className={styles.breadcrumb}>
          <Link to="/">Trang chủ</Link>
          <span className={styles.breadcrumbSep}>/</span>
          <span>Thể loại</span>
        </div>

        <h1 className={styles.pageTitle}>Thể loại sách</h1>
        <p className={styles.pageSubtitle}>Chọn một thể loại để xem toàn bộ sách thuộc danh mục đó</p>

        {loading ? (
          <div className={styles.loading}>
            <div className={styles.spinner} />
            Đang tải...
          </div>
        ) : categories.length === 0 ? (
          <div className={styles.emptyState}>Chưa có danh mục nào</div>
        ) : (
          <div className={styles.grid}>
            {categories.map((cat) => (
              <div key={cat.id} className={styles.card}>
                <Link to={`/shop?category=${cat.id}`} className={styles.cardLink}>
                  <div className={styles.cardImage}>
                    {cat.imageUrl ? (
                      <img src={cat.imageUrl} alt={cat.name} />
                    ) : (
                      <span className={styles.cardPlaceholder}>{cat.name?.charAt(0)}</span>
                    )}
                  </div>
                  <div className={styles.cardBody}>
                    <span className={styles.cardName}>{cat.name}</span>
                    {cat.productCount > 0 && (
                      <span className={styles.cardCount}>{cat.productCount} cuốn sách</span>
                    )}
                  </div>
                </Link>
                {cat.subcategories?.length > 0 && (
                  <div className={styles.subList}>
                    {cat.subcategories.map((sub) => (
                      <Link
                        key={sub.id}
                        to={`/shop?category=${sub.id}`}
                        className={styles.subLink}
                      >
                        {sub.name}
                      </Link>
                    ))}
                  </div>
                )}
              </div>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}

export default Categories;
