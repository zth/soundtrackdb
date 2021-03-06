PGDMP     5    -                 x            soundtrackdb    11.1 (Debian 11.1-1.pgdg90+1)    11.5 )    o           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            p           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            q           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            r           1262    17752    soundtrackdb    DATABASE     |   CREATE DATABASE soundtrackdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';
    DROP DATABASE soundtrackdb;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            s           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3            Z           1247    17754    soundtrack_type    TYPE     H   CREATE TYPE public.soundtrack_type AS ENUM (
    'game',
    'movie'
);
 "   DROP TYPE public.soundtrack_type;
       public       postgres    false    3            �            1259    17759    composer    TABLE     �   CREATE TABLE public.composer (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.composer;
       public         postgres    false    3            �            1255    17767 #   composer_full_name(public.composer)    FUNCTION     �   CREATE FUNCTION public.composer_full_name(composer public.composer) RETURNS text
    LANGUAGE sql STABLE
    AS $$
      select composer.first_name || COALESCE(' ' || composer.last_name, '')
    $$;
 C   DROP FUNCTION public.composer_full_name(composer public.composer);
       public       postgres    false    3    197            �            1259    17768 
   soundtrack    TABLE     Y  CREATE TABLE public.soundtrack (
    id integer NOT NULL,
    title text NOT NULL,
    imdb_id text,
    soundtrack_type public.soundtrack_type NOT NULL,
    release_year timestamp without time zone NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.soundtrack;
       public         postgres    false    602    3            �            1255    17776    search(text)    FUNCTION     �   CREATE FUNCTION public.search(query text) RETURNS SETOF public.soundtrack
    LANGUAGE sql STABLE
    AS $$
      SELECT *
      FROM soundtrack AS s 
      WHERE s.title ILIKE ('%' || query || '%') 
    $$;
 )   DROP FUNCTION public.search(query text);
       public       postgres    false    198    3            �            1259    17777    composer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.composer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.composer_id_seq;
       public       postgres    false    3    197            t           0    0    composer_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.composer_id_seq OWNED BY public.composer.id;
            public       postgres    false    199            �            1259    17779    pgmigrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pgmigrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.pgmigrations_id_seq;
       public       postgres    false    3            �            1259    17781    soundtrack_composer    TABLE     r   CREATE TABLE public.soundtrack_composer (
    composer_id integer NOT NULL,
    soundtrack_id integer NOT NULL
);
 '   DROP TABLE public.soundtrack_composer;
       public         postgres    false    3            �            1259    17784    soundtrack_id_seq    SEQUENCE     �   CREATE SEQUENCE public.soundtrack_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.soundtrack_id_seq;
       public       postgres    false    198    3            u           0    0    soundtrack_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.soundtrack_id_seq OWNED BY public.soundtrack.id;
            public       postgres    false    202            �            1259    17786    track    TABLE     <  CREATE TABLE public.track (
    id integer NOT NULL,
    title text NOT NULL,
    duration integer NOT NULL,
    soundtrack_id integer NOT NULL,
    track_number integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.track;
       public         postgres    false    3            �            1259    17794    track_composer    TABLE     h   CREATE TABLE public.track_composer (
    track_id integer NOT NULL,
    composer_id integer NOT NULL
);
 "   DROP TABLE public.track_composer;
       public         postgres    false    3            �            1259    17797    track_id_seq    SEQUENCE     �   CREATE SEQUENCE public.track_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.track_id_seq;
       public       postgres    false    203    3            v           0    0    track_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.track_id_seq OWNED BY public.track.id;
            public       postgres    false    205            �
           2604    17799    composer id    DEFAULT     j   ALTER TABLE ONLY public.composer ALTER COLUMN id SET DEFAULT nextval('public.composer_id_seq'::regclass);
 :   ALTER TABLE public.composer ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    197            �
           2604    17800    soundtrack id    DEFAULT     n   ALTER TABLE ONLY public.soundtrack ALTER COLUMN id SET DEFAULT nextval('public.soundtrack_id_seq'::regclass);
 <   ALTER TABLE public.soundtrack ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    198            �
           2604    17801    track id    DEFAULT     d   ALTER TABLE ONLY public.track ALTER COLUMN id SET DEFAULT nextval('public.track_id_seq'::regclass);
 7   ALTER TABLE public.track ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    203            d          0    17759    composer 
   TABLE DATA               U   COPY public.composer (id, first_name, last_name, created_at, updated_at) FROM stdin;
    public       postgres    false    197   &/       e          0    17768 
   soundtrack 
   TABLE DATA               o   COPY public.soundtrack (id, title, imdb_id, soundtrack_type, release_year, created_at, updated_at) FROM stdin;
    public       postgres    false    198   �/       h          0    17781    soundtrack_composer 
   TABLE DATA               I   COPY public.soundtrack_composer (composer_id, soundtrack_id) FROM stdin;
    public       postgres    false    201   �0       j          0    17786    track 
   TABLE DATA               i   COPY public.track (id, title, duration, soundtrack_id, track_number, created_at, updated_at) FROM stdin;
    public       postgres    false    203   1       k          0    17794    track_composer 
   TABLE DATA               ?   COPY public.track_composer (track_id, composer_id) FROM stdin;
    public       postgres    false    204   �:       w           0    0    composer_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.composer_id_seq', 5, true);
            public       postgres    false    199            x           0    0    pgmigrations_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.pgmigrations_id_seq', 23, true);
            public       postgres    false    200            y           0    0    soundtrack_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.soundtrack_id_seq', 7, true);
            public       postgres    false    202            z           0    0    track_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.track_id_seq', 137, true);
            public       postgres    false    205            �
           2606    17803    composer composer_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.composer
    ADD CONSTRAINT composer_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.composer DROP CONSTRAINT composer_pkey;
       public         postgres    false    197            �
           2606    17805    soundtrack soundtrack_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.soundtrack
    ADD CONSTRAINT soundtrack_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.soundtrack DROP CONSTRAINT soundtrack_pkey;
       public         postgres    false    198            �
           2606    17807    track track_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.track
    ADD CONSTRAINT track_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.track DROP CONSTRAINT track_pkey;
       public         postgres    false    203            �
           2606    17808 8   soundtrack_composer soundtrack_composer_composer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.soundtrack_composer
    ADD CONSTRAINT soundtrack_composer_composer_id_fkey FOREIGN KEY (composer_id) REFERENCES public.composer(id);
 b   ALTER TABLE ONLY public.soundtrack_composer DROP CONSTRAINT soundtrack_composer_composer_id_fkey;
       public       postgres    false    201    2785    197            �
           2606    17813 :   soundtrack_composer soundtrack_composer_soundtrack_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.soundtrack_composer
    ADD CONSTRAINT soundtrack_composer_soundtrack_id_fkey FOREIGN KEY (soundtrack_id) REFERENCES public.soundtrack(id);
 d   ALTER TABLE ONLY public.soundtrack_composer DROP CONSTRAINT soundtrack_composer_soundtrack_id_fkey;
       public       postgres    false    198    2787    201            �
           2606    17818 .   track_composer track_composer_composer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.track_composer
    ADD CONSTRAINT track_composer_composer_id_fkey FOREIGN KEY (composer_id) REFERENCES public.composer(id);
 X   ALTER TABLE ONLY public.track_composer DROP CONSTRAINT track_composer_composer_id_fkey;
       public       postgres    false    2785    197    204            �
           2606    17823 +   track_composer track_composer_track_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.track_composer
    ADD CONSTRAINT track_composer_track_id_fkey FOREIGN KEY (track_id) REFERENCES public.track(id);
 U   ALTER TABLE ONLY public.track_composer DROP CONSTRAINT track_composer_track_id_fkey;
       public       postgres    false    2789    203    204            �
           2606    17828    track track_soundtrack_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.track
    ADD CONSTRAINT track_soundtrack_id_fkey FOREIGN KEY (soundtrack_id) REFERENCES public.soundtrack(id);
 H   ALTER TABLE ONLY public.track DROP CONSTRAINT track_soundtrack_id_fkey;
       public       postgres    false    2787    198    203            d   z   x�3����M,��K-�M��4202�50�52T04�2��26�34355��#�e�霓�W�雘W���C�)Ɯ�E�y�Ŝ���E%�%dc��tgTfnnj�f�rdd� ����iD� ��K�      e     x����j�0���S�$��r���Xav�ŴjkX�-8����0�]�K@'	����(^�,�1���(,Z"#��+�� ^!*$@���Ӡ`�D�jj���;��J$�q�|�� $�ZiX0�?�ĝ<����a���B� ��8�v-ϊM��GI����W��YPh�R�r�'>q>��Qn.Q��)v�*�Ig-ŋ�s*,���96�4t�M/(��]�C��,�9�岜ȓ�ᇅD4�����n��1��pcT�ꪪ����      h   +   x�3�4�2bCN#.#Nc ۘ˄ӄ˔�(f��\1z\\\ g��      j   �	  x��ZKr#�\���7ϫQ4�߳#��4ar$��eGx���P��@���|��]�Y �,����)|*��
����ȱ�Nde#��I�|IԗTI�~M��Yq�ʢ(�O���u�^^y�i�+���rl�F�i��	��i�{��a%' S%�r&X!����^jye{�{#T��`B���v�ۙY��d�T��z\�s;�j�ˊ	U��=�DZ����ϐ���W@�=8�����Έ"��h��*��� ��g#�m�"X~y���i���@�������D�3dsB��i7~�v�DPw�Ȫ�����čY���e��*C9�{�!�=���A�X)���
��n�HLS�.9@VB����� ��.�����z06�Eq�j���:�G�	ަl��F���u嶐�4�ٳI�&b��W#u��ծ�Қv
ӥ������U�*°D*~���_��v������`\6��Ǧ�C?�!"�i.�u/������$�*.���.zi��,HKq��!r��s�X�*��=���1���voȍDb��#�P�u]/mG�q����I)��#i#.�:�篔?�z���H�T�1ݮ��w�aK�P"ck}�Ľ�a/�֌�|Rl�3{$̖HLvjm�Q�ڸ��eǵe%0����r�����˕�k�+r�:+������B��6{�\�i�� �F7��9�p�9C�0T9��]L����9�kv�6��U��`�yb���>��5-�-빂6Y���of�����H%.r*&6�=5�^�%@v�Ȕ.�-����(r~�c�qڽh�ǝr)�ٗ��b_7���)jb[���x�_�uےxT���4ȫ76�$Al�a�|�`H�J�%Bވ���2�~��B.�[�Q*����ՠ~��A��r�\V ^�g�E��2�H�T{-oplK�g�V�rl�!V��m�+�#\z�m��7.PUk~ږ���~�"ⳋ�\���kc���3u[��`_\�����Vǳ��(ŵ��w˥��z�j��8e#.e0��b��H�t�ߺE���&t�.�jy��{���� �.�PmLLP�u�I���K�R��������L�s5�F��K(�nQ>��Y����{QQ��6sd��ۂ6��ߓr"+�lw	WG�K׶zӓz($��m.�R<腝�V�p���vd2�jQV���[����ح�Zi�7�E�2�i���!�W�D�uFN�z��}a4VV�+�1��g`�I�c�e	-���gm	��y�>zT��	5W�X����_���G��G�"!��l�YJ��y�T˻����} l�bAW��B#�k�Ͳ���U[�\\$�M��	�ո��j1va7)��h�\�V���������_�=R<�K�:C��-���[����L*�q9��p3Ԝ:�/������"'c�<t6}aX~P��=���5�sxݽȰ�)⚚"�KךL 7Ew �" ����{7G�#�[�|ԁ�Oຢ����6q�?*���2����Jw��ϖz�IB�\�ԍ�n�+��H��`T���&�B@�ε��^��@z���i��`i�?./@��i�.��t�zN���_�#R&��]�-�����+HHӔ99U^(�h�AZ��8TNXV�qyҠ~w�7��"ʥHS�[�k�Lc����{�A;�!@鱹�ʸth�(����h6�7ַGIf��
��n
��<��ދ��w�vXZ9������P	�6Z��SMX��L\�T��A�l�&4���9Au�7]�\n��?�!��[M���5�ў�3�(��vI)F޽�N�ߌD[f��%��gt���)؏wH5�ذ7�"�svi[��N��B��(t���	D5sImtv�V���G���S���'l��c-ﷁ�L���z�:�w��|���pvA��ɀ�W���3v~���S7o��o/�h��3�����{�o�@�ܒ��fNW��v���G�Ҹ>60�ye|�Qy�U*��Y����B[��h�/үYv�����hC�����m�gՙ�� ��=Q��e$n�*�N�ǰ}�V��@|?�4���V�ʥ��>��kH����Ѐ>Ao��*6���ˡ�CBynY~r����/�tM���#���*���IY^�gV��GN	ud'%-�c �'I��Ѐl�5ĢE��׈�W��ǰ{�U������_��+9��[���m�Ku*�ǩE��x��C@=��*dɸʿمqd�)vNt�m���3q��ۈ�~x�Zjd�6 �j:�3�Wչ?��^ă��cxHo϶��Mk;d\�Dթ�-�I�3����P� �tgB0�h��Kd�3��C@K�un��}�@#��D�ߦ5erf�q�Y|Q��su���_W	u�������.5Jԭ3d��<?s�qX�!��Y�tu*�oʴ�lX%�V;~/�C�5�)Z��ʙ|64 {2��i5v�ΐ���s��������      k       x�3�4�2b 6bs � bK ����� Es
     