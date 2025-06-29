PGDMP  "                    }            railway    16.8 (Debian 16.8-1.pgdg120+1)    16.4 4    ^           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            _           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            `           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            a           1262    16384    railway    DATABASE     r   CREATE DATABASE railway WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE railway;
                postgres    false            �            1259    32770    abandon_report    TABLE     x  CREATE TABLE public.abandon_report (
    report_id integer NOT NULL,
    reporter_username character varying(50) NOT NULL,
    target_username character varying(50) NOT NULL,
    order_id integer NOT NULL,
    reason text NOT NULL,
    reported_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(20) DEFAULT 'pending'::character varying
);
 "   DROP TABLE public.abandon_report;
       public         heap    postgres    false            �            1259    32769    abandon_report_report_id_seq    SEQUENCE     �   CREATE SEQUENCE public.abandon_report_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.abandon_report_report_id_seq;
       public          postgres    false    222            b           0    0    abandon_report_report_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.abandon_report_report_id_seq OWNED BY public.abandon_report.report_id;
          public          postgres    false    221            �            1259    24578    dorm    TABLE     k   CREATE TABLE public.dorm (
    dorm_name character varying(50) NOT NULL,
    area character varying(50)
);
    DROP TABLE public.dorm;
       public         heap    postgres    false            �            1259    24581    joined_order    TABLE     �   CREATE TABLE public.joined_order (
    username character varying(50) NOT NULL,
    order_id integer NOT NULL,
    quantity integer,
    picked_up_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    picked_up boolean DEFAULT false
);
     DROP TABLE public.joined_order;
       public         heap    postgres    false            �            1259    32843    notifications    TABLE     !  CREATE TABLE public.notifications (
    notification_id integer NOT NULL,
    recipient_username character varying(50),
    title character varying(100),
    message text,
    is_read boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    order_id integer
);
 !   DROP TABLE public.notifications;
       public         heap    postgres    false            �            1259    32842 !   notifications_notification_id_seq    SEQUENCE     �   CREATE SEQUENCE public.notifications_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.notifications_notification_id_seq;
       public          postgres    false    225            c           0    0 !   notifications_notification_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.notifications_notification_id_seq OWNED BY public.notifications.notification_id;
          public          postgres    false    224            �            1259    24584    ordercomment    TABLE     �   CREATE TABLE public.ordercomment (
    comment_id integer NOT NULL,
    order_id integer,
    username character varying(50),
    message text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
     DROP TABLE public.ordercomment;
       public         heap    postgres    false            �            1259    24590    ordercomment_comment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ordercomment_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.ordercomment_comment_id_seq;
       public          postgres    false    217            d           0    0    ordercomment_comment_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.ordercomment_comment_id_seq OWNED BY public.ordercomment.comment_id;
          public          postgres    false    218            �            1259    24591    orders    TABLE     �  CREATE TABLE public.orders (
    host_username character varying(50),
    item_name character varying(100),
    quantity integer,
    total_price integer,
    unit_price numeric(10,2),
    image_url text,
    information text,
    share_method character varying(100),
    share_location character varying(100),
    stop_at_num integer,
    stop_at_date date,
    comment text,
    hashtag text,
    pay_method character varying(50),
    labels text,
    order_id integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    32799    orders_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orders_order_id_seq;
       public          postgres    false    219            e           0    0    orders_order_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;
          public          postgres    false    223            �            1259    24596    users    TABLE     �  CREATE TABLE public.users (
    username character varying(50) NOT NULL,
    nickname character varying(50),
    real_name character varying(100),
    password character varying(100) NOT NULL,
    email character varying(100),
    school character varying(100),
    student_id character varying(20),
    dorm character varying(50),
    score integer,
    phone character varying(20)
);
    DROP TABLE public.users;
       public         heap    postgres    false            �           2604    32773    abandon_report report_id    DEFAULT     �   ALTER TABLE ONLY public.abandon_report ALTER COLUMN report_id SET DEFAULT nextval('public.abandon_report_report_id_seq'::regclass);
 G   ALTER TABLE public.abandon_report ALTER COLUMN report_id DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    32846    notifications notification_id    DEFAULT     �   ALTER TABLE ONLY public.notifications ALTER COLUMN notification_id SET DEFAULT nextval('public.notifications_notification_id_seq'::regclass);
 L   ALTER TABLE public.notifications ALTER COLUMN notification_id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    24601    ordercomment comment_id    DEFAULT     �   ALTER TABLE ONLY public.ordercomment ALTER COLUMN comment_id SET DEFAULT nextval('public.ordercomment_comment_id_seq'::regclass);
 F   ALTER TABLE public.ordercomment ALTER COLUMN comment_id DROP DEFAULT;
       public          postgres    false    218    217            �           2604    32800    orders order_id    DEFAULT     r   ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);
 >   ALTER TABLE public.orders ALTER COLUMN order_id DROP DEFAULT;
       public          postgres    false    223    219            X          0    32770    abandon_report 
   TABLE DATA           ~   COPY public.abandon_report (report_id, reporter_username, target_username, order_id, reason, reported_at, status) FROM stdin;
    public          postgres    false    222   �D       Q          0    24578    dorm 
   TABLE DATA           /   COPY public.dorm (dorm_name, area) FROM stdin;
    public          postgres    false    215   E       R          0    24581    joined_order 
   TABLE DATA           ]   COPY public.joined_order (username, order_id, quantity, picked_up_at, picked_up) FROM stdin;
    public          postgres    false    216   �E       [          0    32843    notifications 
   TABLE DATA           {   COPY public.notifications (notification_id, recipient_username, title, message, is_read, created_at, order_id) FROM stdin;
    public          postgres    false    225   DF       S          0    24584    ordercomment 
   TABLE DATA           [   COPY public.ordercomment (comment_id, order_id, username, message, created_at) FROM stdin;
    public          postgres    false    217   G       U          0    24591    orders 
   TABLE DATA           �   COPY public.orders (host_username, item_name, quantity, total_price, unit_price, image_url, information, share_method, share_location, stop_at_num, stop_at_date, comment, hashtag, pay_method, labels, order_id) FROM stdin;
    public          postgres    false    219   (G       V          0    24596    users 
   TABLE DATA           w   COPY public.users (username, nickname, real_name, password, email, school, student_id, dorm, score, phone) FROM stdin;
    public          postgres    false    220   �I       f           0    0    abandon_report_report_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.abandon_report_report_id_seq', 8, true);
          public          postgres    false    221            g           0    0 !   notifications_notification_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.notifications_notification_id_seq', 22, true);
          public          postgres    false    224            h           0    0    ordercomment_comment_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.ordercomment_comment_id_seq', 8, true);
          public          postgres    false    218            i           0    0    orders_order_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.orders_order_id_seq', 8, true);
          public          postgres    false    223            �           2606    32779 "   abandon_report abandon_report_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.abandon_report
    ADD CONSTRAINT abandon_report_pkey PRIMARY KEY (report_id);
 L   ALTER TABLE ONLY public.abandon_report DROP CONSTRAINT abandon_report_pkey;
       public            postgres    false    222            �           2606    24603    dorm dorm_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.dorm
    ADD CONSTRAINT dorm_pkey PRIMARY KEY (dorm_name);
 8   ALTER TABLE ONLY public.dorm DROP CONSTRAINT dorm_pkey;
       public            postgres    false    215            �           2606    32810    joined_order joined_order_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.joined_order
    ADD CONSTRAINT joined_order_pkey PRIMARY KEY (username, order_id);
 H   ALTER TABLE ONLY public.joined_order DROP CONSTRAINT joined_order_pkey;
       public            postgres    false    216    216            �           2606    32852     notifications notifications_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (notification_id);
 J   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_pkey;
       public            postgres    false    225            �           2606    24607    ordercomment ordercomment_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.ordercomment
    ADD CONSTRAINT ordercomment_pkey PRIMARY KEY (comment_id);
 H   ALTER TABLE ONLY public.ordercomment DROP CONSTRAINT ordercomment_pkey;
       public            postgres    false    217            �           2606    32802    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    219            �           2606    24611    users users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    220            �           2606    32837 +   abandon_report abandon_report_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.abandon_report
    ADD CONSTRAINT abandon_report_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 U   ALTER TABLE ONLY public.abandon_report DROP CONSTRAINT abandon_report_order_id_fkey;
       public          postgres    false    222    219    3248            �           2606    32780 4   abandon_report abandon_report_reporter_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.abandon_report
    ADD CONSTRAINT abandon_report_reporter_username_fkey FOREIGN KEY (reporter_username) REFERENCES public.users(username);
 ^   ALTER TABLE ONLY public.abandon_report DROP CONSTRAINT abandon_report_reporter_username_fkey;
       public          postgres    false    3250    220    222            �           2606    32785 2   abandon_report abandon_report_target_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.abandon_report
    ADD CONSTRAINT abandon_report_target_username_fkey FOREIGN KEY (target_username) REFERENCES public.users(username);
 \   ALTER TABLE ONLY public.abandon_report DROP CONSTRAINT abandon_report_target_username_fkey;
       public          postgres    false    3250    222    220            �           2606    32827 '   joined_order joined_order_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.joined_order
    ADD CONSTRAINT joined_order_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 Q   ALTER TABLE ONLY public.joined_order DROP CONSTRAINT joined_order_order_id_fkey;
       public          postgres    false    219    216    3248            �           2606    24617 '   joined_order joined_order_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.joined_order
    ADD CONSTRAINT joined_order_username_fkey FOREIGN KEY (username) REFERENCES public.users(username);
 Q   ALTER TABLE ONLY public.joined_order DROP CONSTRAINT joined_order_username_fkey;
       public          postgres    false    216    3250    220            �           2606    32863 )   notifications notifications_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 S   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_order_id_fkey;
       public          postgres    false    219    225    3248            �           2606    32853 3   notifications notifications_recipient_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_recipient_username_fkey FOREIGN KEY (recipient_username) REFERENCES public.users(username);
 ]   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_recipient_username_fkey;
       public          postgres    false    3250    220    225            �           2606    32832 '   ordercomment ordercomment_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordercomment
    ADD CONSTRAINT ordercomment_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 Q   ALTER TABLE ONLY public.ordercomment DROP CONSTRAINT ordercomment_order_id_fkey;
       public          postgres    false    219    217    3248            �           2606    24627 '   ordercomment ordercomment_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordercomment
    ADD CONSTRAINT ordercomment_username_fkey FOREIGN KEY (username) REFERENCES public.users(username);
 Q   ALTER TABLE ONLY public.ordercomment DROP CONSTRAINT ordercomment_username_fkey;
       public          postgres    false    3250    220    217            �           2606    24632     orders orders_host_username_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_host_username_fkey FOREIGN KEY (host_username) REFERENCES public.users(username);
 J   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_host_username_fkey;
       public          postgres    false    219    3250    220            �           2606    24637    users users_dorm_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_dorm_fkey FOREIGN KEY (dorm) REFERENCES public.dorm(dorm_name);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_dorm_fkey;
       public          postgres    false    220    215    3242            X      x������ � �      Q   �   x�{�t�/:z9�-X�|�ާ���t<m]�rɊ�{:���w����щW���� ������XTT1v
~m�k�i{ں]۳i�O�s�ι��O���˩�_tt@�	C<�bXu'6�ؼ6d
V��`X�����XUC��"�(8����?۰�ٮ	`q*���� `[@      R   i   x�uʱ�@��7E�e��w����m�
���!$^�Ǻ+a����,1C&Y*�D9ftk��Iȟ��R�ytK��׶�YX81��\�}���{��[�<Wn����      [   �   x�32�,-N-2�|6��Ɏ��k۞M��{��i�o� $9��]��iׂ�Z^�h
=n�y1���橏z�n�Q�~O#g	��������������������������	��9��gU~*�V=�5�ٜ�]_,��|���[f��������h����9��%��!gIQ%ݬ5�02Y���� ��      S      x������ � �      U   a  x��T�n�@>��"@+{��BB�z�8���Zۭ�S�
���
"B���B�U�a�c�-��7�m.Hc'ޝ��ff7
����z6M�]U�����*�;��C�XF3i0�m%B4��
���	�D�=���O9Yl��)���!�Ct���e�!��V�d�9~1]Shױ\L+d4-$���
��l ���y�~��I��w�#�r/r�uUM(k�4��Y�P��8��P�A�Aת��.��fAQRM�t����$��]�'Ʀ�Aȩ��[��[���[��T�lBS�����<��3W�v����=*$�gXH -�Z�:V�p�|���X͍S6��L�����)��x�gc_E���n�Df��B�.��\ЫDg���UfQ���gG����?9f��4��C7���3	�.}-��dbt}*��AM��B��I*Ap25��q=Pn�nHU��Qr�2���1��t�O��A��W��Y�9�����*�5Q@Ț��\K9�\����:��9Y��/�wStK��_o��H�����՗����I��^�F���/?������/�k��y6:���9�����vk���]EQ���|�      V   �  x�eS�NA>�<O�����r0FW8h��2�2�ӳ��H�']���AML4���Oð�[X==;��5]U�|�]�!,���-�(p'���v��Nc-������&�B����l;�ħ�1f���e[t�ɶJ�̴ E�����I(%܃�'����S�;���N�o	���.*�� � �V��i,�a�]�,�褾�>� ��ji�.��!L��=�Q���2j������%,A���Ȇ���Eτ$��\_mӃ���D� Ѵ0>�=>����]~|���g�����ϼ_Ȭ$$������P��Rr.,��@��8��
�P��k�Z�?6x�;��Z�@�[ICo�p�� :q7|-⻄ǚ�]`�����E�۱M�%�m,�-	j�z����U��|�l�g�4pa��G|��L���޶��I�K!�YN!WӿF�]�2M�X�Z�qB��M#��ܐ#���c�c��)z�0�Blf+6a����F��4q�6=!�m�Ùa'�B]���g��և	l�'���4�)�|���?J�O��lRO���}�ꋪZK���_a��)}�;>��]�>M���æU ,�'�\r�&#���O�?�w;0ǉgR5����W�UC&��Q�u<�Xm���ɲ     